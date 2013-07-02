Deface::Override.new(
  :virtual_path => 'spree/admin/orders/index',
  :name => 'add_export_orders_link',
  :insert_before => "#listing_orders",
  :text => "
    <%= link_to 'Export CSV', spree.orders_path(format: 'csv') %>
  ")

