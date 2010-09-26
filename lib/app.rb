
require 'rubygems'
require 'sinatra/base'

require 'active_record'
require 'model/model'
require 'helpers/browser_helper'

#For the file name escaping unescaping
require 'cgi'

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
         
      
      #Mixin extra functions
      include UnWatched::BrowserHelper
      
      set :public, "public"

      configure :production  do
      end

      configure :development do
      end

      configure :test do
      end
     
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
         UnWatched::Extension.delete_all
         ext_array = params['post']['ext'].split(',')
         ext_array.each do |ext|
            ext.strip!
            UnWatched::Extension.find_or_create_by_ext( ext )
         end

         @ext = UnWatched::Extension.all
         erb :pref
      end

      
      ####################################
      ### Main Route 
      ####################################
      get '/*' do
         @path      = get_path( params['path'] )
           
         #Check if Media file, and launch if required.   
         media_test = open_media( @path )
            
         if media_test[:media]
            ## Redirect, do not include the file to be launched.
            ## This allows browser to be refreshed to get a new file list.
            redirect "/" + params["splat"].to_s + "?path=" +  media_test[:path]

         else
            @url                    = params['splat'].to_s
     
            #Determine mode from url 
            @mode, @merged, @sort   = discover_mode_from_url( @url ) 
                   
            ## Create base_urls
            @url_normal, @url_safe  = create_base_url( @url, @mode ) 

            ## Create urls for sorting links 
            @url_alpha, @url_mod    = create_sort_urls( @url.dup, @sort ) 

            ## create url for merged/unmerged views
            @url_merged             = create_merged_url( @url, @merged )

            @files                  = get_files( @path.dup, @mode, @sort )
            erb :all
         end
      end

   end #class
end #module



if $0 == __FILE__
   UnWatched::App.run!
end

