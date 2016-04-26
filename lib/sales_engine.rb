require "csv"
require "pry"
require_relative "repository"
require_relative "merchant/merchant"
require_relative "merchant/merchant_repository"

class SalesEngine
  attr_reader :merchant_repository

  def initialize(path)
    @path = path
  end

  def startup
    @merchant_repository = MerchantRepository.new(@path)
  end
end
=begin
engine = SalesEngine.new("data")
engine.startup

p engine.merchant_repository.find_all_by_name("Williamson Group")
=end
