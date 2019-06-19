class Admins::ProvincesController < BaseController
	def index

	end

	def create
		Province.delete_all
		District.delete_all
		Ward.delete_all
		@response = HTTParty.post(
      'https://apiv3-test.ghn.vn/api/v1/apiv3/GetDistricts',
      body: {
            token: 'TokenStaging',
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

		@response = HTTParty.post(
      'https://apiv3-test.ghn.vn/api/v1/apiv3/GetWards',
      body: {
        token: 'TokenStaging',
      }.to_json,
      headers: {
        'Accept' => 'application/json',
	      'Content-Type' => 'application/json'
      }
    )

    @response['data']['Wards'].each do |item|
    	Ward.create(
    		ward_name: item['WardName'],
    		ward_id: item['WardCode'],
    		district_id: District.find_by(district_id: item['DistrictID']).id
    	)
    end

    render 'index'
	end
end