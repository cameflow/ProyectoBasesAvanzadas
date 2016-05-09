class Recipe
  include Neo4j::ActiveNode

  has_many :out, :ingredients, type: :HAS_INGREDIENT
  has_one :out, :dish, type: :MAKES_DISH

  property :name, type: String
  property :description, type: String



end
