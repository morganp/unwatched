module UnWatched
   

   class Open < ActiveRecord::Base

    def self.store( new_cmd )
      open          = self.first
      open.command  = new_cmd
      open.save

      return new_cmd
    end

   end

end

