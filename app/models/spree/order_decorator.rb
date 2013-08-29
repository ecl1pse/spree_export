require 'csv'
Spree::Order.instance_eval do

  def self.completed_between(start_date, end_date)
    where(completed_at: start_date..end_date)
  end

  def self.paid_and_ready_to_ship
    where(payment_state: 'paid', shipment_state: 'ready')
  end

  def self.export_csv(options = {})
    options = SpreeExport.csv_options.merge options

    CSV.generate(options) do |csv|

      if SpreeExport.order_csv_block.nil?

        address_column_names = ["firstname", "lastname", "address1", "address2", "city", "zipcode", "phone", "state_name", "alternative_phone", "company"]
        order_column_names = ["id", "number", "total", "state", "shipment_state", "email", "user_id", "completed_at", "payment_state", "special_instructions"]
        column_headers = order_column_names + address_column_names
        csv << column_headers
        all.each do |order|
          values = order.attributes.values_at(*order_column_names) + order.ship_address.attributes.values_at(*address_column_names)
          csv << values
        end
      else
        SpreeExport.order_csv_block.call csv, all
      end
    end
  end

end
