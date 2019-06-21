class RemoveFileJob < ApplicationJob
  queue_as :default

  def perform(path,file)
  	 FileUtils.rm_f(path+'/'+file)
  end


end
