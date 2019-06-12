# CarrierWave.configure do |config|
#   if Rails.env.staging? || Rails.env.production?
#     config.fog_provider = 'fog/aws' 
#     config.fog_credentials = {
#       :provider => 'AWS',
#       :aws_access_key_id => 'AKIAXILANUF6HKQO42PR',
#       :aws_secret_access_key => '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',
#       :region => 'ap-southeast-1' 
#     }
#     config.fog_directory = "doanshoes"
#     config.storage = :fog
#   else
#     config.storage = :file
#     config.enable_processing = Rails.env.development?
#   end
# end