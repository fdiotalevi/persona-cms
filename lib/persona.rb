require 'rubygems'
require 'erb'
require 'sinatra'
require 'builder'

require File.join(File.dirname(__FILE__), './persona', 'file')
autoload :Post, 'persona/post'
autoload :Page, 'persona/page'


#ROUTES

get '/' do   
  @posts = Post.all
  erb :index
end

get '/feed/' do
  builder do |xml|
    xml.instruct! :xml, :version => '1.0'
    xml.rss :version => "2.0" do
      xml.channel do
        xml.title ($config['site']['title'])
        xml.description ($config['site']['description'])
        xml.link ($config['site']['url'])

        load_posts.first(10).each do |post|
          xml.item do
            xml.title post.title
            xml.link(($config['site']['url'])+"/"+post.url)
            xml.description post.content
            xml.pubDate post.date.strftime("%a, %d %b %Y %H:%M:%S %z")
            xml.guid(($config['site']['url'])+"/"+post.url)
          end
        end
      end
    end
  end
end

get '/feed' do
  redirect '/feed/'
end

get '/:y/:m/:d/:name/' do
  @page = Post.from_url params[:y], params[:m], params[:d], params[:name]
  erb :post
end

get '/:y/:m/:d/:name' do            #wrong link, but WP supports it
  redirect "/#{params[:y]}/#{params[:m]}/#{params[:d]}/#{params[:name]}/"
end

get '/pages/:name' do
  @page = Page.new params[:name]
  erb :page
end

error do
  erb :not_found
end

not_found do
  erb :not_found
end

