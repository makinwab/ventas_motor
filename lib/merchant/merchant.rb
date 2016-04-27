class Merchant
  attr_accessor :id, :name, :created_at, :updated_at, :items, :invoices

  def initialize
    @items = []
    @invoices = []
  end
end
