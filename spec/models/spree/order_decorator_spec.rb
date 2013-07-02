require 'spec_helper'

describe Spree::Order do
  before do
    create_list(:completed_order_with_totals, 1)
  end

  let(:orders) { Spree::Order.order("created_at") }
  let(:order) { orders.first }

  describe "self.generate_csv" do
    let(:csv) { orders.generate_csv }

    it "#generate_csv" do
      csv.should include("id,number,total,state,shipment_state,email,user_id,completed_at,payment_state,special_instructions,firstname,lastname,address1,address2,city,zipcode,phone,state_name,alternative_phone,company")
      csv.should include(order.id.to_s)
      csv.should include(order.number)
      csv.should include(order.total.to_s)
      csv.should include(order.state)
      csv.should include(order.shipment_state)
      csv.should include(order.email)
      csv.should include(order.user_id.to_s)
      csv.should include(order.completed_at.to_s)
      csv.should include(order.payment_state)
      csv.should include(order.special_instructions) if order.special_instructions.present?
      csv.should include(order.ship_address.firstname)
      csv.should include(order.ship_address.lastname)
      csv.should include(order.ship_address.address1)
      csv.should include(order.ship_address.address2)
      csv.should include(order.ship_address.city)
      csv.should include(order.ship_address.zipcode)
      csv.should include(order.ship_address.phone)
      csv.should include(order.ship_address.state_name) if order.ship_address.state_name.present?
      csv.should include(order.ship_address.alternative_phone)
      csv.should include(order.ship_address.company)
    end
  end

end
