class DownFileJob < ApplicationJob
  include AmazonS3Helper
  queue_as :default

  def perform(key)
  	  s3 = AmazonS3Helper.s3
      @obj= s3.bucket('data-images-of-shoes').object(key.to_s)
  	  @obj.get(response_target: Rails.root.join("public/#{@obj.key}"))
  end


end