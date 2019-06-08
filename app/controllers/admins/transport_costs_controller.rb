class Admins::TransportCostsController < BaseController
	  include ActionController::Helpers
	  helper AmazonS3Helper
  require 'aws-sdk-s3'

  def new

  end

  def create
   if  TransportCost.import(params[:file])
    s3 = AmazonS3Helper.s3
    params[:file].original_filename = 'list63provinces'+ File.extname(params[:file].original_filename)
    obj = s3.bucket('doanshoes').object(params[:file].original_filename)
    obj.upload_file(params[:file].path)
    redirect_to  admins_transport_costs_path
   else
   	render 'new' , alert: 'file error'
   end	

  end

  def index
    @provinces = TransportCost.all
  end
end
