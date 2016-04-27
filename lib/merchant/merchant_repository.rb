require_relative "merchant"

class MerchantRepository < Repository
  alias :merchant_instances :model_instances

  #load up merchant csv file
  def initialize(folder)
    @@folder = folder
    super(folder, "merchants", Merchant)

    set_items
  end

  def set_items
    count = 0
    item_instances = ItemRepository.new(@@folder).model_instances
    merchant_instances.each do |merchant|
      item_instances.each do |item|
        if item.merchant_id == merchant.id
          merchant.items << item
        end
      end
    end
  end
end
