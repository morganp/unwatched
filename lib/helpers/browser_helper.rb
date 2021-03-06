module UnWatched
   module BrowserHelper

      def url_strip_word( url, word )
         temp_url = url.gsub(/(\/)?#{word}/, "")
         temp_url.gsub!(/^\//, '')
      end



      def get_path( path )
         path  =   path ||= '/'
         ## expand path turns into ./1/2/.. into ./1
         @path =   File.expand_path( path )
      end



      def discover_mode_from_url( url )

         ## Default Behaviours
         mode       = :normal
         merged     = false
         sort       = :sort_alpha_asc

         #Turn URL in words and set appropriate mode
         splats = url.to_s.split("/")
         splats.each do |splat|
            case splat
               when "safe" 
                  mode = :safe

               when "merged"
                  merged = true

               when "alpha"
                  sort = :sort_alpha_asc

               when "alpha_desc"
                  sort = :sort_alpha_desc

               when "mod"
                  sort = :sort_mod_asc

               when "mod_desc"
                  sort = :sort_mod_desc

            end
         end
         return [mode,merged,sort]
      end


      def create_base_url( url, mode )
         case mode
            when :normal
               url_normal = url
               url_safe = "safe/" + url 

            when :safe
               url_normal = url_strip_word( url, "safe" )
               url_safe   = url
         end

         return [url_normal, url_safe]
      end



      def create_sort_urls( url, sort )
         ## Create sort base_url
         temp_url  = remove_sort( url )
         url_alpha = ''
         url_mod   = ''

        puts
        puts "Recieved sort is #{sort}"

         case sort
            when :alpha_asc
               url_alpha = "sort/alpha_desc/" + temp_url
               url_mod   = "sort/mod_asc/"        + temp_url

            when :alpha_desc
               url_alpha = "sort/alpha_asc/" + temp_url
               url_mod   = "sort/mod_asc/"   + temp_url

            when :mod_asc
               url_alpha = "sort/alpha_asc/"    + temp_url
               url_mod   = "sort/mod_desc/" + temp_url

            when :mod_desc
               url_alpha = "sort/alpha_asc/" + temp_url
               url_mod   = "sort/mod_asc/"   + temp_url

            #TODO NEED otherwise else statment to find non matching things and apply default   

         end

         puts url_alpha
         puts url_mod
puts

         return [url_alpha, url_mod]
      end


      def remove_sort( url )
         url.gsub!(/(\/)?alpha_desc/, '')
         url.gsub!(/(\/)?mod_desc/, '')
         url.gsub!(/(\/)?alpha/, '')
         url.gsub!(/(\/)?mod/, '')
         url.gsub!(/^\//, '')
         return url
      end



      def  create_merged_url( url, merged )
         if merged
            url_merged = url_strip_word( url, "merged" )
         else
            url_merged = "merged/" + url
         end
         return url_merged
      end



      def open_media( path )
         ## Clicked File to play
         path = CGI.unescape( path )
         
         if path.match( /#{Extension.allowed_extension}/ )
            if File.exists?(path)

               command = Open.first.command
               open("| #{command} '#{path}'")
              
               path      = mark_media("watched", path)
               return { :media=>true, :path=>path[:path] }
            else
               puts "Error #{path} does not exist"
               return { :media=>false, :path=>path }
            end
         else
            return { :media=>false, :path=>path }
         end
      end

      def mark_media( mark, path, mode='')
         unesc_path = CGI.unescape( path )
         
         if File.directory?(path)
            #if directory recurse over file list
            list_current_mode_files( path, mode ).each do |file| 
               mark_media( mark, file[:path])
            end

            return {:media=>true, :path=>path}
         
         else
            #is file
            file_name = File.basename( unesc_path )

            if mark == "watched"
               node      = UnWatched::Node.find_or_create_by_name( file_name )
            else
               if  UnWatched::Node.exists?( :name=>file_name )
                  node      = UnWatched::Node.find_by_name( file_name )
                  UnWatched::Node.destroy(node)
               end
            end
            path      = File.dirname( unesc_path )

            return { :media=>true, :path=>path }
         end
      end




      def get_files( path, mode, sort )
         files                   = list_current_mode_files( path, mode )
        
         ## Filter list into Browser,watched & unwatched
         files,watched,unwatched = filter_watched_unwatched_files( files )

         ## Sort The Arrays
         files                   = files.sort_by { |file| file[:label].downcase }

         # Add up link after sort
         files.insert(0, {:path => (path + '/..'), :label => 'UP .. '})

         #Sort Files based on mode
         unwatched               = sort_media_files( unwatched, sort )
         watched                 = sort_media_files(   watched, sort )

         return {
            :files      => files, 
            :unwatched  => unwatched, 
            :watched    => watched 
         }
      end


      ## Filter allowed normal/safe files based on mode
      def list_current_mode_files( path, mode )
         ## Remove Trailing / on folders
         path.gsub!(/\/$/,'')
         files = Dir.glob(path + '/*')

         ## Make new Array with hash for path, labels etc
         files_filtered = Array.new
         files.each do |file|
            # Safe mode check here rather than an extra loop
            if ( mode == :safe ) and  file.match(/XXX/)
               #Blocked file
            else
               files_filtered << { 
                  :path     => CGI.escape( file ),
                  :label    => File.basename(file),
                  :modified => File.stat(file).mtime.strftime(UnWatched::DATE_FORMAT)
               }
            end
         end
         return files_filtered
      end


      # Filter file list into directory, watched and unwatched arrays 
      def filter_watched_unwatched_files( files )
         watched           = Array.new
         unwatched         = Array.new

         files.delete_if do |file|
            test = file[:label].match( /#{Extension.allowed_extension}/ )
            # Check if in Database (on click to play)
            if test
               if UnWatched::Node.find_by_name(file[:label])
                  watched << file
               else
                  unwatched << file
               end
            else
               ## Only display folders in the browser Pane 
               if not File.directory?(CGI.unescape(file[:path]))
                  #Delete File
                  test = true
               end
            end

            # return true if the file is to be delted from array
            test
         end

         return [files, watched, unwatched]
      end



      def sort_media_files( files, sort )
         if sort == :mod_asc or  sort == :mod_desc
            files = files.sort_by { |file| File.stat(CGI.unescape(file[:path])).mtime }
         else
            files = files.sort_by { |file| file[:label].downcase }
         end

         if sort == :mod_desc or sort == :alpha_desc
            files.reverse!
         end

         return files
      end


   end   
end

