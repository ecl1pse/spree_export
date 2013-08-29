require 'spree_core'
require 'spree_export/engine'

module SpreeExport

  mattr_accessor :csv_options
  self.csv_options = {}

  mattr_accessor :output_encoding
  self.output_encoding = Encoding::UTF_8

  mattr_accessor :order_csv_block
  mattr_accessor :user_csv_block

  def self.config &block
    yield(self)
  end

end
