
require 'rubygems'
require 'sinatra/base'
require 'sinatra/session'


require 'active_record'
require 'model/node'
require 'model/extension'
require 'helpers/browser_helper'

#For the file name escaping unescaping
require 'cgi'

require 'pp'

module UnWatched

  ## Modes
  # These are the symbols used to denote the modes
  #:normal
  #:safe
  #:merged          
  #:sort_mod_asc    
  #:sort_mod_desc   
  #:sort_alpha_asc  
  #:sort_alpha_desc 

  DATE_FORMAT = "%I:%M%p %b %d %Y"

  class App < Sinatra::Base
    register Sinatra::Session



    #Mixin extra functions
    include UnWatched::BrowserHelper

    set :public, "public"

    configure :production  do
      ActiveRecord::Base.establish_connection(
        :adapter    => 'sqlite3',
        :database   => File.dirname( __FILE__) + '/db/unwatched.db'
      )
    end

    configure :development do
      ActiveRecord::Base.establish_connection(
        :adapter    => 'sqlite3',
        :database   => File.dirname( __FILE__) + '/db/unwatched.db'
      )
    end

    configure :test do
      ActiveRecord::Base.establish_connection(
        :adapter    => 'sqlite3',
        :database   => File.dirname( __FILE__) + '/db/unwatched_test.db'
      )
    end

    #UnWatched::create_db


    ####################################
    ### ROUTES 
    ####################################
    ### Prefs
    ####################################
    get '/pref' do
      @ext = UnWatched::Extension.all
      erb :pref
    end

    post '/pref' do
      @ext = UnWatched::Extension.parse_string( params['post']['ext'] )
      erb :pref
    end

    get '/sort/:mode/?' do
      session[:sort] = params[:mode].to_sym
      redirect '/?path=' + get_path( params['path'] )
    end

    get '/mode/:mode/?' do
      session[:mode] = params[:mode].to_sym
      redirect '/?path=' + get_path( params['path'] )
    end

    ####################################
    ### Main Route 
    ####################################
    get '/*' do
      session_start!
      session[:name] ||= 0
      session[:name] += 1

      session[:mode]   ||= :normal
      session[:filter] ||= :normal
      session[:sort]   ||= :alpha_asc 



      @url                    = params['splat'].to_s

      #Determine mode from url 
      @mode, @merged, @sort   = discover_mode_from_url( @url )

      @path      = get_path( params['path'] )

      mark    =  params['mark']
      mark    ||= false
      puts mark
      #Check if Media file, and launch if required.   
      if not mark
        media_test = open_media( @path )
      else
        #Mark files appropriatelly
        media_test = mark_media( mark, @path, @mode)
      end

      if media_test[:media]
        ## Redirect, do not include the file to be launched.
        ## This allows browser to be refreshed to get a new file list.
        redirect "/" + params["splat"].to_s + "?path=" +  media_test[:path]

      else
        ## Create base_urls
        @url_normal, @url_safe  = create_base_url( @url, @mode ) 

        ## Create urls for sorting links 
        @url_alpha, @url_mod    = create_sort_urls( @url.dup, session[:sort] ) 

        ## create url for merged/unmerged views
        @url_merged             = create_merged_url( @url, @merged )

        @files                  = get_files( @path.dup, @mode, session[:sort] )

        erb :all
      end
    end

  end #class
end #module



if $0 == __FILE__
  UnWatched::App.run!
end

