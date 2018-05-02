class Company < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true, :col_sep => ';') do |row|
      Company.create! row.to_hash
    end  
  end

  def self.to_csv

    CSV.generate(headers: true) do |csv|
      columns = %w{id name manager status terms}

      csv << columns.map(&:humanize)
     
      all.each do |company|
        csv << company.attributes.values_at(*columns)
      end
    end
  end
end
