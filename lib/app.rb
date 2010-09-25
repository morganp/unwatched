
require 'rubygems'
#compass ##Here
require 'sinatra/base'
#require 'sinatra'

require 'active_record'
require 'model'


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
end


module UnWatched

   class App < Sinatra::Base
      
      set :public, "public"

      configure :production  do
      end

      configure :development do
      end

      configure :test do
      end
     
      begin
         #Load extra functions
         path = File.expand_path( __FILE__ )
         path = File.dirname( path )
         require "./helpers/browser_helper"
      rescue
         puts "Helpers not loading correctly"
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
           
         media_test = open_media( @path )
            
         if media_test[:media]
            debug( "if media_test" )
            ## This redirect to not include the file to be launched
            ##  This allows browser to be refreshed to get the new file list
            redirect "/" + params["splat"].to_s + "?path=" +  media_test[:path]
         else
            debug( "if not media_test" )
      
            @url                    = params['splat'].to_s
     
             ## Default Behaviours
             @mode       = UnWatched::NORMAL
             @sort       = UnWatched::SORT_ALPHA_ASC
             @merged     = false
      
             puts "URL: " + @url
             splats = @url.to_s.split("/")
             splats.each do |splat|
             case splat
                when "safe" 
                   @mode = UnWatched::SAFE
                when "merged"
                   @merged = true
                when "alpha"
                   @sort = UnWatched::SORT_ALPHA_ASC
                when "alpha_desc"
                   @sort = UnWatched::SORT_ALPHA_DESC
                when "mod"
                   @sort = UnWatched::SORT_MOD_ASC
                when "mod_desc"
                   @sort = UnWatched::SORT_MOD_DESC
                end
                   
             end
      
             ## Create sor base_url
             case @mode
                when UnWatched::NORMAL
                   @url_normal = @url
                   @url_safe = "safe/" + @url 
                when UnWatched::SAFE
                   temp_url = @url.gsub(/(\/)?safe/, "")
                   temp_url.gsub!(/^\//, '')
                   if temp_url == ""
                      temp_url = "/"
                   end
                   @url_normal = temp_url
                   @url_safe   = @url
      
                   puts "SAFE MODE"
                   puts  @url_safe
             end
           
             @url_alpha, @url_mod = urls_for_sort_links( @url.dup ) 

             if @merged
                temp_url = @url.gsub(/(\/)?merged/, "")
                temp_url.gsub!(/^\//, '')
                @url_merged = temp_url
             else
                @url_merged = "merged/" + @url
             end
      
             @files = get_files( @path, @mode, @sort )
             #@param = get_params(  params )
             erb :all
          end
       end
   
   end #class
end #module

if $0 == __FILE__
   UnWatched::App.run!
end

