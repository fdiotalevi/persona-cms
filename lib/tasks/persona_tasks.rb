require 'fileutils'
 
class PersonaTasks
  
  def self.create_site(base_dir, site_name)
    FileUtils.cp_r '../template', base_dir
  end
  
  
end