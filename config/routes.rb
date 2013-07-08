Spree::Core::Engine.routes.draw do
  get '/admin/users_export_csv/', to: 'Admin::Users#export_csv', as: "export_users_csv"
  get '/admin/orders/export_csv/', to: 'Admin::Orders#export_csv', as: "export_csv"
end
