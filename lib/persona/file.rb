class File
  require 'yaml'
  
  def content_as_string
    doc_started = false
    metadata, data = '', ''
    self.each_line do |line|
      doc_started = true if line.chop == ''
      if (doc_started)
        data += line
      else
        metadata +=line
      end
    end
    @metadata = YAML.parse(metadata)
    return data
  end
  
  def metadata(name)
    @metadata[name].value
  end
  
end