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

set :output, "shoes_database_dump_use_whenever.sql"
set :environment, 'development'

every 50.minute do
   command "mysqldump -u root -p'phamtien9`' shoes"
   # runner "MyModel.some_method"
   # rake "some:great:rake:task"
end
# Learn more: http://github.com/javan/whenever
