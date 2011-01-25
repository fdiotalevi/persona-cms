require 'fileutils'
 
class PersonaTasks
  
  def self.create_site(base_dir, site_name)
    FileUtils.cp_r(File.join(File.dirname(__FILE__), "..", "..", "template"), site_name)
  end
  
  
end