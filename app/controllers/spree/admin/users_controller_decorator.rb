Spree::Admin::UsersController.class_eval do
  def export_csv
    @users = Spree::User.order("created_at")
    send_data @users.export_csv
  end
end
