Persona
=======

Persona is a minimal personal content manager. It is designed for geeks: you need to have Ruby and Git installed in your machine, and know how to use it. However, you don't need to be a Ruby developer.

Principles:
*   it's for geeks
*   it's minimal (150 lines of code at the moment)
*   leverage cloud services and infrastructure
*   lets you create a website for free (no hosting fees)

In this stage it's a work in progress, without much documentation.

Prerequisites
-------------
You need to have
 1. Ruby (1.8.7 or 1.9.2) 
 2. RubyGems
 3. git
 4. a Rack compatible HTTP Server 
installed on your machine.

If you don't have a Rack server, or you don't know what is it, after you have installed Ruby and RubyGems just type

    $ gem install thin

Notice: depending on your installation, you might see some problem with permissions while executing the previous command. In this case, try

    $ sudo gem install thin


Create your site
----------------

    $ gem install persona
    $ persona create_site myblog
    $ cd myblog 

done.

Test your website
-----------------

From the 'myblog' folder, start your Rack server. If you installed thin, type

    $ thin start

and open your browser to [localhost:3000](http://localhost:3000/ "localhost:3000")

Add contents
------------

Pages and blog posts are (at the moment, will likely change soon) specified in HTML-ish files inside the folders /contents/pages  and /contents/posts.
Have a look at the sample provided in your website.

Every file specifies in the first 3 rows some metadata (title, author and date) and, after a blank line, the HTML content of the page/post.

To add a new page, just create another .txt file in the /contents/page folder.  If the file is called myfile.txt, it will immediately be visible at http://localhost/pages/myfile

To add a new blog post, create a .txt file with this naming convention:
    <year>-<month>-<day>-<post_title>.txt
The blog post will be immediately visible under  http://localhost/<year>/<month>/<date>/<post_title>
	
	
Customize
---------

The folders
    public
    views
    config
contain files you can customize. Have a look!



(that's it for now, will post more details soon)
	

