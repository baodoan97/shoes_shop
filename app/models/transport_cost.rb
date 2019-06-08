class TransportCost < ApplicationRecord
  def self.open_file(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, options={})
    when ".xls" then Roo::Excel.new(file.path, options={})
    when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end


  def self.import(file_path)
    TransportCost.destroy_all
    ActiveRecord::Base.connection.execute('ALTER TABLE transport_costs AUTO_INCREMENT = 1')
    file = open_file(file_path)
    (1..file.last_row).each do |i|
      row = file.row(i)
      province = TransportCost.new
      province.province=row[0]
      province.price=row[1]
      province.save
    end
    return true
  end
end
