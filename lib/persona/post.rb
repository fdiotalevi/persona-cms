class Post
  
  attr_reader :content, :title, :author, :url, :date, :excerpt, :is_excerpt
  
  def initialize(file_name)
    f = File.open("./contents/posts/#{file_name}","r")
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