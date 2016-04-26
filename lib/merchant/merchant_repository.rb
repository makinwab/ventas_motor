class MerchantRepository < Repository
  #load up merchant csv file
  def initialize(folder)
    super(folder, "merchants", Merchant)
  end
end
