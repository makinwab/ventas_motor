class Merchant
  attr_accessor :id, :name, :created_at, :updated_at, :items

  def initialize
    @items = []
  end

  def items=(item)
    @items << item
  end

  def items
    @items
  end
end
