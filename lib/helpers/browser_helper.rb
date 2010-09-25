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
      temp_url = remove_sort( url )
      url_alpha = ''
      url_mod = ''
      case sort
         when :sort_alpha_asc
            url_alpha = "alpha_desc/" + temp_url
            url_mod   = "mod/"        + temp_url

         when :sort_alpha_desc
            url_alpha = "alpha/" + temp_url
            url_mod   = "mod/"   + temp_url

         when :sort_mod_asc
            url_alpha = "alpha/"    + temp_url
            url_mod   = "mod_desc/" + temp_url

         when :sort_mod_desc
            url_alpha = "alpha/" + temp_url
            url_mod   = "mod/"   + temp_url

      end
      return [url_alpha, url_mod]
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
            puts "Error #{path} does not exist"
            return {:media=>false, :path=>path}
         end
      else
         return {:media=>false, :path=>path}
      end
   end



   def get_files( path, mode, sort )
      debug( "get_files( #{path} #{mode}  #{sort} )" )

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
               :path     => file,
               :label    => File.basename(file),
               :modified => File.stat(file).mtime.strftime(UnWatched::DATE_FORMAT)
            }
         end
      end
      return files_filtered
   end


   # Filter file list into directory, watched and unwatched arrays 
   def filter_watched_unwatched_files( files )
      unwatched         = Array.new
      watched           = Array.new

      allowed_extension = get_extensions 

      files.delete_if do |file|
         test = file[:label].match( /#{allowed_extension}/ )
         # Check if in Database (on click to play)
         if test
            if UnWatched::Node.find_by_name(file[:label])
               watched << file
            else
               unwatched << file
            end
         else
            ## Only display folders in the browser Pane 
            if not File.directory?(file[:path])
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
      if sort == :sort_mod_asc or  sort == :sort_mod_desc
         files = files.sort_by { |file| File.stat(file[:path]).mtime }
      else
         files = files.sort_by { |file| file[:label].downcase }
      end

      if sort == :sort_mod_desc or sort == :sort_alpha_desc
         files.reverse!
      end

      return files
   end


