module PagesHelper
	def get_brands
		brands = []
        Brand.all.each do |brand|
           name = brand.brand_name.gsub(brand.category.name,'')
           brands.push(name)
        end
        brands.uniq
        brand_list = []
        brands.each do |name|
        brand_list.push(Brand.all.where('brand_name LIKE ?', "%#{name}%").select{ |v| v.image_main_brand.attached? == true }.first)
        end
        brand_list.uniq
	end
end
