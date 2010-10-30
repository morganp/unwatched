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

DB[:extensions].insert(:ext => 'avi')
DB[:extensions].insert(:ext => 'mkv')
DB[:extensions].insert(:ext => 'mov')
DB[:extensions].insert(:ext => 'm4v')
##########################################################

DB.create_table :opens do
  primary_key    :id
  varchar        :command
end

DB[:opens].insert(:command => 'open')
##########################################################

DB.create_table :favourites do
  primary_key    :id
  varchar        :name
  varchar        :path
end

DB[:favourites].insert(:name => 'root', :path => '/')
##########################################################

DB.create_table :mergeds do
  primary_key    :id
  varchar        :path
end

##########################################################
DB.create_table :modes do
  primary_key    :id
  varchar        :name
  integer        :order
end

DB[:modes].insert(:name => 'Safe', :order => 1)
##########################################################

DB.create_table :filters do
  primary_key    :id
  foreign_key    :mode_id, :mode
  varchar        :expresion
  integer        :order
end

DB[:filters].insert(:expresion => 'xxx', :order => 1)
##########################################################

