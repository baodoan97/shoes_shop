class Admins::ManagesController < BaseController
  include ActionController::Helpers
  helper AmazonS3Helper
  require 'open-uri'
  def index
  end
  def process_data
    s3 = AmazonS3Helper.s3
    @obj= s3.bucket('doanshoes').objects.select { |obj| (obj.key =~ /database/) }.sort_by(&:last_modified).reverse!

  end
  def download
    s3 = AmazonS3Helper.s3
    @obj= s3.bucket('doanshoes').object(params[:key]+'.sql')
    data = open(@obj.presigned_url(:get))
    send_data data.read, filename: @obj.key
  end
  def get_file_database
    # Product.all.each do |product|
    #     product.images.each do |image|
    #     DownFileJob.set(wait: 1.seconds).perform_later(image.key)
    #   end
    # end
    filename = 'database.sql'
    system "mysqldump -u root -p'phamtien9`' shoes > #{filename};"
    send_file("#{Rails.root}/#{filename}")
    RemoveFileJob.set(wait: 1.minutes).perform_later(Rails.root.to_s,filename)
  end
  
  def set_file_database
    tmp = params[:file].tempfile
    destiny_file = File.join('public', 'uploads', params[:file].original_filename)
    FileUtils.move tmp.path, destiny_file
    system "mysql -u root -p'phamtien9`' -e 'drop database shoes_db; ' " 
    system "mysql -u root -p'phamtien9`' -e 'create database shoes_db; ' "
    system "mysql -u root -p'phamtien9`' shoes_db < #{destiny_file}"
    system "rails db:migrate"
    FileUtils.rm_f(destiny_file)
    redirect_to admins_process_data_path, notice: 'Import file databases successfully'

  end


  def delete
    param[:model].constantize.all.where(status: 'closed').map do |item|
      item.destroy
    end
    redirect_to admins_process_data_path
  end
end
