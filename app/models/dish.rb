class Dish
  include Neo4j::ActiveNode

  has_many :out, :orders, type: :HAS_ORDER

  validates :cost, numericality: {greater_than_or_equal_to: 0}
  property :name, type: String
  property :cost, type: Float



end
