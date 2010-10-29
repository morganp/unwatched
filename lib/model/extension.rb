module UnWatched


  class Extension < ActiveRecord::Base

    def self.allowed_extension
      allowed_extension = ''
      self.all.each do |x|
        allowed_extension << "\\\." + x.ext + "$|"
      end
      allowed_extension.chop! 
    end

    def self.parse_string( extensions )
      self.delete_all
      ext_array = extensions.split(',')
      ext_array.each do |ext|
        ext.strip!
        self.find_or_create_by_ext( ext )
      end

      return self.all
    end 

  end

end

