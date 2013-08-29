require 'spree_core'
require 'spree_export/engine'

module SpreeExport

  mattr_accessor :csv_options
  self.csv_options = {}

  mattr_accessor :output_encoding
  self.output_encoding = Encoding::UTF_8

  def self.config &block
    yield(self)
  end

end
