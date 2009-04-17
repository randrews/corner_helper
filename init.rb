# Include hook code here
class ActionController::Base
  helper :corner
end

path=File.join(File.dirname(__FILE__),%w{res corners.png})
dest_path=File.join(RAILS_ROOT,%w{public images})

FileUtils.cp(path,dest_path) unless File.exists?(File.join(dest_path, 'corners.png'))
