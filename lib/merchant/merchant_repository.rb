require_relative "merchant"

class MerchantRepository < Repository
  alias :merchant_instances :model_instances

  #load up merchant csv file
  def initialize(folder)
    @@folder = folder
    super(folder, "merchants", Merchant)

    add_collection(ItemRepository, "items")
    add_collection(InvoiceRepository, "invoices")
  end

  private

  def add_collection(collection, type)
    instances = collection.new(@@folder).model_instances
    merchant_instances.each do |merchant|
      traverse_and_add_collection(merchant, instances) do |model|
        merchant.items << model if type == "items"
        merchant.invoices << model if type == "invoices"
      end
    end
  end

  def traverse_and_add_collection(merchant, instances, &block)
    instances.each do |model|
      if model.merchant_id == merchant.id
        block.call(model)
      end
    end
  end
end
