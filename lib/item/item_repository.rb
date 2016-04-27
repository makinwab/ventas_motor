require_relative "item"

class ItemRepository < Repository
  def initialize(folder)
    super(folder, "items", Item)
  end
end
