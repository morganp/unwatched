(Un)Watched
===========

Is an application to help you track unwatched media files, Similar to iTunes functionality for podcasts.

Browse files and click to play. Application will only display folders in top panel and allowed (via prefs) files in un-watched/watched panels

Starting application
--------------------

    gem install Sinatra active_record sequel sqlite3-ruby 

Currently you need to manualy create the database.

    cd lib/db
    ruby create_db.rb

to run

    cd ../
    ruby app.rb

NB: Shotgun loads faster and is a better for development.

    shotgun -p 4567 app.rb 


TODO
----

Default location
Configurable launch command (wired to open)
Download RSS feeds
local rss feed, of folder.

Help/Requests/Comments
----

unwatched_gem@amaras-tech.co.uk

