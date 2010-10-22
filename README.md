(Un)Watched
===========

Is an application to help you track unwatched media files, Similar to iTunes functionality for podcasts.

Browse files and click to play. Application will only display folders in top panel and allowed (via prefs) files in un-watched/watched panels

Starting application
--------------------

    gem install Sinatra active_record sequel sqlite3-ruby 
    git clone git://github.com/morganp/unwatched.git

Currently you need to manually create the database.

    cd lib/db
    ruby create_db.rb

to run

    cd ../
    ruby app.rb

Now vist 127.0.0.1:4567 in your favourite browser.

TODO
----

Default location  
Configurable launch command (wired to open)  
Download RSS feeds  
local rss feed of a folder.  

Help/Requests/Comments
----

unwatched_gem@amaras-tech.co.uk

