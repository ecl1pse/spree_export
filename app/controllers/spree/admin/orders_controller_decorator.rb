Spree::Admin::OrdersController.class_eval do
  def export_csv
    created_at_gt = Time.zone.parse(params[:created_at_gt]).beginning_of_day rescue ""
    created_at_lt = Time.zone.parse(params[:created_at_lt]).end_of_day rescue ""

    @orders = Spree::Order.paid_and_ready_to_ship.completed_between(created_at_gt, created_at_lt).order("created_at")
    send_data @orders.export_csv.encode(SpreeExport.output_encoding, :invalid => :replace, :replace => '?'), :filename => csv_filename(:name => 'orders', :date_start => created_at_gt, :date_end => created_at_lt)
  end
end
