Spree::Admin::BaseController.class_eval do
  def csv_filename args
    args = {:name => 'report'}.merge(args)
    fmt = '%Y-%m-%d'
    parts = [args[:name]]
    [:date_start, :date_end].each { |k| parts << args[k].strftime(fmt) if args.has_key?(k) }
    parts.join('_') + '.csv'
  end
end
