require 'csv'
Spree::User.instance_eval do

  def self.export_csv(options = {})
    options = SpreeExport.csv_options.merge options

    CSV.generate(options) do |csv|
      if SpreeExport.user_csv_block.nil?
        user_column_names = ["id", "email", "login"]
        column_headers = user_column_names
        csv << column_headers
        all.each do |user|
          values = user.attributes.values_at(*user_column_names)
          csv << values
        end
      else
        SpreeExport.user_csv_block.call csv, all
      end
    end
  end

end
