require_relative "customer"

class CustomerRepository < Repository
  def initialize(folder)
    @@folder = folder
    super(folder, "customers", Customer)
  end
end
