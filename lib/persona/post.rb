class Post
  
  attr_reader :content, :title, :author, :url, :date, :excerpt, :is_excerpt
  
  POST_FOLDER = './contents/posts'
  
  def initialize(file_name)
    f = File.open("#{POST_FOLDER}/#{file_name}","r")
    @content =  f.content_as_string
    @title = f.metadata 'title'
    @author = f.metadata 'author'  
    @date = Date.strptime(f.metadata('date'), '%Y/%m/%d')
    @excerpt = create_excerpt(@content)
        
    splits = /(\d{4}-\d{2}-\d{2})-([^\/]*)\.txt$/.match file_name    
    if splits
      @url = splits[1].gsub(/[-]/, "/") + "/" + splits[2] + "/"            
    end
            
    f.close     
  end
  
  def self.from_url(y,m,d,name)
    Post.new "#{y}-#{m}-#{d}-#{name}.txt"    
  end
  
  def self.all
    posts = Dir.entries("#{POST_FOLDER}").sort.reverse.reject do |it|
      not it.end_with? '.txt'
    end

    posts.map do |it|
      Post.new it
    end  
  end
  
  private
  
  MORE_TAG = '<!--more-->'
  
  def create_excerpt(content)
    if content.include? MORE_TAG
      @is_excerpt = true
      content.partition(MORE_TAG)[0] + "(... continued ...) "
    else
      content
    end
  end
      
end