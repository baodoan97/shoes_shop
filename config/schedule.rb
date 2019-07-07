# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 50.minute do
  rake "Find_user_not_comfirmable"
  rake "Find_carts_user_not_update_for_3_days"
end
require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output,"#{Rails.root}/shoes_database_dump_use_whenever.sql"
set :environment, 'development'
every 30.minute do
  command "mysqldump -u root -p'phamtien9`' shoes"
  s3 = Aws::S3::Resource.new(region: 'ap-southeast-1',
                             access_key_id: 'AKIAXILANUF6HKQO42PR',
                             secret_access_key: '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',)
  path = "#{Rails.root}/shoes_database_dump_use_whenever.sql"
  filename = ""
  time_footprint = Time.now.to_formatted_s(:number)
  File.open(path) do |file|
    filename = "database_#{time_footprint}"+ File.extname(file)
    File.rename(file, filename)
  end
  path = "#{Rails.root}/#{filename}"
  file = Rack::Test::UploadedFile.new(path)
  obj = s3.bucket('doanshoes').object(file.original_filename)
  obj.upload_file(file.path)
  FileUtils.rm_f(path)
  obj= s3.bucket('doanshoes').objects.select { |obj| (obj.key =~ /database/) }.sort_by &:last_modified
  if obj.count > 10
    obj.take(1).map do |file|
      file.delete
    end
  end
end
# Learn more: http://github.com/javan/whenever
