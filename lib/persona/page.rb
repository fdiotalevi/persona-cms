class Page
  
  attr_reader :content, :title, :author
  
  def initialize(name)
    f = File.open("./contents/pages/#{name}.txt","r")
    @content =  f.content_as_string
    @title = f.metadata 'title'
    @author = f.metadata 'author'          
    f.close
  end
  
end