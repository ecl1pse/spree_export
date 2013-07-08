require 'csv'
Spree::User.instance_eval do

  def self.export_csv(options = {})
    CSV.generate(options) do |csv|
      user_column_names = ["id", "email", "login"]
      column_headers = user_column_names
      csv << column_headers
      all.each do |user|
        values = user.attributes.values_at(*user_column_names)
        csv << values
      end
    end
  end

end
