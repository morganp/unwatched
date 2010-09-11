require 'rubygems'
require 'sequel'
 
# Connect to the database
DB = Sequel.sqlite('./unwatched.db')

##########################################################
  DB.create_table :nodes do
    primary_key :id
    foreign_key :parent_id, :nodes
    varchar :name
  end

  DB.create_table :extensions do
      primary_key    :id
      varchar        :ext
  end



##########################################################


