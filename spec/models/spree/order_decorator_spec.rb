require 'spec_helper'

describe Spree::Order do
  before do
    create_list(:completed_order_with_totals, 2)
  end

  let(:orders) { Spree::Order.order("created_at") }
  let(:order) { orders.first }

  describe "self.export_csv" do
    let(:csv) { orders.export_csv }
    subject { csv }

    it { should include("id,number,total,state,shipment_state,email,user_id,completed_at,payment_state,special_instructions,firstname,lastname,address1,address2,city,zipcode,phone,state_name,alternative_phone,company") }
    it { should include(order.id.to_s) }
    it { should include(order.number) }
    it { should include(order.total.to_s) }
    it { should include(order.state) }
    it { should include(order.shipment_state) }
    it { should include(order.email) }
    it { should include(order.user_id.to_s) }
    it { should include(order.completed_at.to_s) }
    it { should include(order.payment_state) }
    it { should include(order.special_instructions) if order.special_instructions.present? }
    it { should include(order.ship_address.firstname) }
    it { should include(order.ship_address.lastname) }
    it { should include(order.ship_address.address1) }
    it { should include(order.ship_address.address2) }
    it { should include(order.ship_address.city) }
    it { should include(order.ship_address.zipcode) }
    it { should include(order.ship_address.phone) }
    it { should include(order.ship_address.state_name) if order.ship_address.state_name.present? }
    it { should include(order.ship_address.alternative_phone) }
    it { should include(order.ship_address.company) }
  end

end
