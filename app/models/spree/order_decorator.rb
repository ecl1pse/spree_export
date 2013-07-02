require 'csv'
Spree::Order.instance_eval do

  def self.generate_csv(options = {})
    CSV.generate(options) do |csv|
      address_column_names = ["firstname", "lastname", "address1", "address2", "city", "zipcode", "phone", "state_name", "alternative_phone", "company"]
      order_column_names = ["id", "number", "total", "state", "shipment_state", "email", "user_id", "completed_at", "payment_state", "special_instructions"]
      column_headers = order_column_names + address_column_names
      csv << column_headers
      all.each do |order|
        values = order.attributes.values_at(*order_column_names) + order.ship_address.attributes.values_at(*address_column_names)
        csv << values
      end
    end
  end

end
