module UnWatched
   

   class Extension < ActiveRecord::Base

      def self.allowed_extension
         allowed_extension = ''
         self.all.each do |x|
            allowed_extension << "\\\." + x.ext + "$|"
         end
         allowed_extension.chop! 
      end
   end

end

