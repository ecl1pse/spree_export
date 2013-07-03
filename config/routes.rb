Spree::Core::Engine.routes.draw do
  get '/admin/orders/export_csv/', to: 'Admin::Orders#export_csv', as: "export_csv"
end
