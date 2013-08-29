Spree::Admin::UsersController.class_eval do
  def export_csv
    @users = Spree::User.order("created_at")
    send_data @users.export_csv, :filename => csv_filename(:name => 'users', :date_end => Time.now)
  end
end
