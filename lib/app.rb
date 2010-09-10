
require 'rubygems'
#compass ##Here
require 'sinatra/base'
#require 'sinatra'

require 'active_record'
## TODO s


# TODO add db init and migrations into executable

# TODO config options default location default sort 

# TODO Merged view, 
# TODO merged view prefs

# TODO watched button
# TODO not watched button
# TODO mark all as read button

# TODO prefs and other urls do not set safe mode correctly
# TODO handle spaces in the url path

# TODO write specs!
module UnWatched

class App < Sinatra::Base
   set :raise_errors, Proc.new { false }
   set :sessions, false
   set :static, true
   set :show_exceptions, false 
   set :public, "public"


   configure :production, :development do
      ActiveRecord::Base.establish_connection(
         :adapter    => 'sqlite3',
         :database   => './db/unwatched.db'
      )
   end

   configure  :test do
      ActiveRecord::Base.establish_connection(
         :adapter    => 'sqlite3',
         :database   => '../db/unwatched.db'
      )
   end


   
   class Node < ActiveRecord::Base
      has_many :nodes, :class_name => "Node",  :foreign_key => "parent_id"  
      belongs_to :parent, :class_name => "Node" 
   end

   class Extension < ActiveRecord::Base
   end

   ## Modes 
   NORMAL          = 100
   SAFE            = 200
   MERGED          = 10
   SORT_MOD_ASC    = 1
   SORT_MOD_DESC   = 2
   SORT_ALPHA_ASC  = 3
   SORT_ALPHA_DESC = 4

   

   
   $DATE_FORMAT = "%I:%M%p %b %d %Y"
   #$VIDEO_FORMAT_REGEX = /\.avi$|\.mpg$|\.wmv$|\.mkv$|\.m4v$|\.mp4$/

#   yui = "\\\.m4v$"
#   $VIDEO_FORMAT_REGEX = /#{yui}/
#
   def debug( msg )
      if true
         puts msg
      end
   end

   def get_path( path )
      debug( "get_path( #{path} )" )
      path  =   path ||= '/'
      ## expand path turns into ./1/2/.. into ./1
      @path =   File.expand_path( path )
   end

   def get_extensions
      debug( "get_extensions" )
      allowed_extension = ''
      Extension.all.each do |x|
         allowed_extension << "\\\." + x.ext + "$|"
      end
      allowed_extension.chop! 
   end

   def open_media( path )
      debug( "open_media( #{path} )" )
      allowed_extension = get_extensions 
      
      ## Clicked File to play
      if path.match( /#{allowed_extension}/ )
         if File.exists?(path) 
            open("| open #{path}")
           
            # Check if in Database (on click to play)
            file_name = File.basename( path )
            node      = Node.find_or_create_by_name( file_name )
            path      = File.dirname( path )
            return {:media=>true, :path=>path}
         else
            # TODO throw exception here
            puts "Error #{path} does not exist"
         end
      else
         return {:media=>false, :path=>path}
      end
   end

   def get_files( path, mode, sort )
      debug( "get_files( #{path} #{mode}  #{sort} )" )

      #mode ||= NORMAL
      #sort ||= SORT_ALPHA_ASC

      #puts "get_files( " + path.to_s + ", " + mode.to_s + " )"
      files       = Array.new
      unwatched   = Array.new
      watched     = Array.new

      allowed_extension = get_extensions 
      
      ## Clicked File to play
#      if path.match( /#{allowed_extension}/ )
#         open("| open #{path}")
        
#         # Check if in Database (on click to play)
#         file_name = File.basename( path )
#         node      = Node.find_or_create_by_name( file_name )
#         path      = File.dirname( path )
#      end

      ##
      #n_path = File.expand_path( path )
      ## path should already have been validated by get_path

      ## Remove double // incident when at root
      path.gsub!(/\/$/,'')
      files = Dir.glob(path + '/*')
      
      ## Make new Array with hash for path, labels etc
      files_two = Array.new
      files.each do |file|
         # Safe mode check here rather than an extra loop
         if ( mode == SAFE ) and  file.match(/XXX/)
            #puts "Blocked : " + file
         else
            files_two << { 
               :path     => file,
               :label    => File.basename(file),
               :modified => File.stat(file).mtime.strftime($DATE_FORMAT)
            }
         end
      end
      
      ## Some maintenance
      # files could not be modified directly in the loop above
      files = files_two
      complete_list = files.dup

      ## Iterate over files 
      complete_list.each do |file|
         # Check if in Database (on click to play)
         if file[:label].match( /#{allowed_extension}/ )
            node = Node.find_by_name(file[:label])
            if node
               watched << file
            else
               unwatched << file
            end
            ## Do not double list files
            files.delete(file)
            #puts "Matched: " + file[:label]
         else
            ## Only display folders in the browser Pane 
            if not File.directory?(file[:path])
               files.delete(file)
               #puts "Not Dir: " + file[:label]
            end
         end

      end


      ## Sort The Arrays
      files     = files.sort_by     { |file| file[:label].downcase }
      if sort == SORT_MOD_ASC or  sort == SORT_MOD_DESC
         unwatched = unwatched.sort_by { |file| File.stat(file[:path]).mtime }
         watched   = watched.sort_by {   |file| File.stat(file[:path]).mtime }
      else
         unwatched = unwatched.sort_by { |file| file[:label].downcase }
         watched   = watched.sort_by   { |file| file[:label].downcase }
      end

      if sort == SORT_MOD_DESC or sort == SORT_ALPHA_DESC
         unwatched.reverse!
         watched.reverse!
      end
      # Add up link after sort
      files.insert(0, {:path => (path + '/..'), :label => 'UP .. '})

      return {
         :files => files, 
         :unwatched => unwatched, 
         :watched => watched 
      }
   end

#   #def get_params( params )
#   #   param = " "
#   #   params.each do |key, paramx|
#   #      param <<  key.to_s + "=" + paramx.to_s + "&"
#   #   end
#   #   return param
#   #end
#
#
   def remove_sort( url )
      debug( "remove_sort( #{url} )" )
      url.gsub!(/(\/)?alpha_desc/, '')
      url.gsub!(/(\/)?mod_desc/, '')
      url.gsub!(/(\/)?alpha/, '')
      url.gsub!(/(\/)?mod/, '')
      url.gsub!(/^\//, '')
      return url
   end


####################################
### ROUTES 
####################################
### Prefs
####################################


   get '/pref' do
     #@a = 1 + 2
     @ext = Extension.all
     #erb :pref
     "Heloo"
   end
#
#   post '/pref' do
#      Extension.delete_all
#      ext_array = params['post']['ext'].split(',')
#      ext_array.each do |ext|
#        ext.strip!
#        Extension.find_or_create_by_ext( ext )
#      end
#
#      @ext = Extension.all
#      erb :pref
#   end
#
#
####################################
### Main Route 
####################################
#   get '/*' do
#      @path       = get_path( params['path'] )
#      
#      media_test = open_media( @path )
#      
#      if media_test[:media]
#         debug( "if media_test" )
#         ## This redirect to not include the file to be launched
#         ##  This allows browser to be refreshed to get the new file list
#         redirect "/" + params["splat"].to_s + "?path=" +  media_test[:path]
#      else
#         debug( "if not media_test" )
#
#         @url        = params['splat'].to_s
#
#         ## Default Behaviours
#         @mode       = NORMAL
#         @sort       = SORT_ALPHA_ASC
#         @merged     = false
#
#         puts "URL: " + @url
#         splats = @url.to_s.split("/")
#         splats.each do |splat|
#         case splat
#            when "safe" 
#               @mode = SAFE
#            when "merged"
#               @merged = true
#            when "alpha"
#               @sort = SORT_ALPHA_ASC
#            when "alpha_desc"
#               @sort = SORT_ALPHA_DESC
#            when "mod"
#               @sort = SORT_MOD_ASC
#            when "mod_desc"
#               @sort = SORT_MOD_DESC
#            end
#             
#         end
#
#        ## Create sor base_url
#         case @mode
#            when NORMAL
#               @url_normal = @url
#               @url_safe = "safe/" + @url 
#            when SAFE
#               temp_url = @url.gsub(/(\/)?safe/, "")
#               temp_url.gsub!(/^\//, '')
#               if temp_url == ""
#                  temp_url = "/"
#               end
#               @url_normal = temp_url
#               @url_safe   = @url
#
#               puts "SAFE MODE"
#               puts  @url_safe
#         end
#         
#         ## Create sort base_url
#         temp_url = remove_sort( @url.dup )
#         case @sort
#            when SORT_ALPHA_ASC
#               @url_alpha = "alpha_desc/" + temp_url
#               @url_mod   = "mod/" + temp_url
#            when SORT_ALPHA_DESC
#               @url_alpha = "alpha/" + temp_url
#               @url_mod   = "mod/" + temp_url
#            when SORT_MOD_ASC
#               @url_alpha = "alpha/" + temp_url
#               @url_mod   = "mod_desc/" + temp_url
#            when SORT_MOD_DESC
#               @url_alpha = "alpha/" + temp_url
#               @url_mod   = "mod/" + temp_url
#         end
#
#         if @merged
#            temp_url = @url.gsub(/(\/)?merged/, "")
#            temp_url.gsub!(/^\//, '')
#            @url_merged = temp_url
#         else
#            @url_merged = "merged/" + @url
#         end
#
#         @files = get_files( @path, @mode, @sort )
#         #@param = get_params(  params )
#         erb :all
#      end
#   end
#

get '/'  do
   "Hello World!"
end



end #class
end #module

if $0 == __FILE__
#   App.run!
   UnWatched::App.run!
end

