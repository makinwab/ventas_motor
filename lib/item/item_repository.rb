require_relative "item"

class ItemRepository < Repository
  def initialize(folder)
    @@folder = folder
    super(folder, "items", Item)
  end
end
