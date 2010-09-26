module UnWatched
   ActiveRecord::Base.establish_connection(
      :adapter    => 'sqlite3',
      :database   => File.dirname( __FILE__) + '/db/unwatched.db'
   )

   class Node < ActiveRecord::Base
      has_many :nodes, :class_name => "Node",  :foreign_key => "parent_id"  
      belongs_to :parent, :class_name => "Node" 
   end

   class Extension < ActiveRecord::Base
   end

end

