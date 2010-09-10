require 'rubygems'
require 'sequel'
 
# Connect to the database
DB = Sequel.sqlite('./amaras_webview.db')

##########################################################
  DB.create_table :nodes do
    primary_key :id
    foreign_key :parent_id, :nodes
    varchar :name
  end


##########################################################


