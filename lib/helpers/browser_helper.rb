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

