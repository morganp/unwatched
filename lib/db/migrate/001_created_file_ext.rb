Class.new(Sequel::Migration) do

def up
      create_table :extensions do
         primary_key    :id
         varchar        :ext
      end
   end

   def down 
      drop_table :extensions
   end
end
## Command line to apply Migration
#rake db:migrate VERSION=1

## Command to roll back
#rake db:migrate VERSION=0

#class CreateFileExtActiveRecord < ActiveRecord::Migration
#
#   def self.up
#      add_column :posts, :date_modified, :varchar, :default => "Monday"
#   end
#
#   def self.down
#         remove_column :posts, :date_modified
#   end
#
#end

