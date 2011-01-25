require 'rubygems'
require 'erb'
require 'bundler'
require 'sinatra'
require 'builder'

#ROUTES

get '/' do   
  @posts = load_posts
  erb :index
end

get '/f
eed/' do
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


def load_posts
  posts = Dir.entries('./contents/posts').sort.reverse.reject do |it|
    not it.end_with? '.txt'
  end
      
  posts.map do |it|
    Post.new it
  end  
end

