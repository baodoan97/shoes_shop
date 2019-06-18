class Admins::ProvincesController < BaseController
	def index

	end

	def create
		Province.delete_all
		District.delete_all
		@response = HTTParty.post(
      'https://apiv3-test.ghn.vn/api/v1/apiv3/GetDistricts',
      body: {
            token: 'TokenStaging',
            Email: 'mr.cupo97@gmail.com',
            Password: '98776597'
      }.to_json,
      headers: {
        'Accept' => 'application/json',
      'Content-Type' => 'application/json'
      }
    )

		@response['data'].each do |item|
			if !Province.find_by(province_id: item['ProvinceID'])
				@province = Province.new
				@province.province_id = item['ProvinceID']
				@province.province_name = item['ProvinceName']
				@province.save
			else
				@province = Province.find_by(province_id: item['ProvinceID'])
			end
			if !District.find_by(district_id: item['DistrictID'])
				@district = District.new
				@district.district_name = item['DistrictName']
				@district.district_id = item['DistrictID']
				@district.province_id = @province.id
				@district.save
			end
		end


	    render 'index'
	end
end