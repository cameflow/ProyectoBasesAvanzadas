class Ingredient
  include Neo4j::ActiveNode

  has_many :in, :recipes, type: :BELONGS_TO
  has_many :out, :subingredients, rel_class: :InStock

  property :name, type: String
  property :cost, type: Float



end
