   def debug( msg )
      if true == false
         puts msg
      end
   end

   def url_strip_word( url, word )
      temp_url = url.gsub(/(\/)?#{word}/, "")
      temp_url.gsub!(/^\//, '')
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
         UnWatched::Extension.all.each do |x|
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
               node      = UnWatched::Node.find_or_create_by_name( file_name )
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

         files       = Array.new
         unwatched   = Array.new
         watched     = Array.new

         allowed_extension = get_extensions 
         
         ## Remove double // incident when at root
         path.gsub!(/\/$/,'')
         files = Dir.glob(path + '/*')
         
         ## Make new Array with hash for path, labels etc
         files_two = Array.new
         files.each do |file|
            # Safe mode check here rather than an extra loop
            if ( mode == UnWatched::SAFE ) and  file.match(/XXX/)
               #puts "Blocked : " + file
            else
               files_two << { 
                  :path     => file,
                  :label    => File.basename(file),
                  :modified => File.stat(file).mtime.strftime(UnWatched::DATE_FORMAT)
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
               node = UnWatched::Node.find_by_name(file[:label])
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
         if sort == UnWatched::SORT_MOD_ASC or  sort == UnWatched::SORT_MOD_DESC
            unwatched = unwatched.sort_by { |file| File.stat(file[:path]).mtime }
            watched   = watched.sort_by {   |file| File.stat(file[:path]).mtime }
         else
            unwatched = unwatched.sort_by { |file| file[:label].downcase }
            watched   = watched.sort_by   { |file| file[:label].downcase }
         end

         if sort == UnWatched::SORT_MOD_DESC or sort == UnWatched::SORT_ALPHA_DESC
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



      def remove_sort( url )
         debug( "remove_sort( #{url} )" )
         url.gsub!(/(\/)?alpha_desc/, '')
         url.gsub!(/(\/)?mod_desc/, '')
         url.gsub!(/(\/)?alpha/, '')
         url.gsub!(/(\/)?mod/, '')
         url.gsub!(/^\//, '')
         return url
      end

   def urls_for_sort_links( url )
      ## Create sort base_url
      temp_url = remove_sort( url )
      url_alpha = ''
      url_mod = ''
      case @sort
         when UnWatched::SORT_ALPHA_ASC
            url_alpha = "alpha_desc/" + temp_url
            url_mod   = "mod/"        + temp_url
         when UnWatched::SORT_ALPHA_DESC
            url_alpha = "alpha/" + temp_url
            url_mod   = "mod/"   + temp_url
         when UnWatched::SORT_MOD_ASC
            url_alpha = "alpha/"    + temp_url
            url_mod   = "mod_desc/" + temp_url
         when UnWatched::SORT_MOD_DESC
            url_alpha = "alpha/" + temp_url
            url_mod   = "mod/"   + temp_url
      end
      return [url_alpha, url_mod]
   end

