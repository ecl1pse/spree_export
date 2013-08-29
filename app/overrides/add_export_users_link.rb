Deface::Override.new(
  :virtual_path => 'spree/admin/users/index',
  :name => 'add_export_users_csv_link',
  :insert_top => "#listing_users",
  :text => "
    <%= link_to Spree.t('export.export_users', :default =>'Export Users'), spree.export_users_csv_path, class: 'button', id: 'export_csv' %>
  ")


