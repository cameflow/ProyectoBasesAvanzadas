class Ingredient
  include Neo4j::ActiveNode

  has_many :in, :recipes, type: :BELONGS_TO

  property :name, type: String
  property :cost, type: Float



end
