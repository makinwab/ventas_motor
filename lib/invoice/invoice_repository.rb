require_relative "invoice"

class InvoiceRepository < Repository
  alias :invoice_instances :model_instances

  def initialize(folder)
    @@folder = folder
    super(folder, "invoices", Invoice)

    add_collection(CustomerRepository, "customer")
  end

  private

  def add_collection(collection, type)
    instances = collection.new(@@folder).model_instances
    invoice_instances.each do |invoice|
      traverse_and_add_collection(invoice, instances) do |model|
        invoice.customer = model
        break
      end
    end
  end

  def traverse_and_add_collection(invoice, instances, &block)
    instances.each do |model|
      if invoice.customer_id == model.id
        block.call(model)
        break
      end
    end
  end
end
