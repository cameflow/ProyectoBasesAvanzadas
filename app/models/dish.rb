class Dish 
  include Neo4j::ActiveNode
  property :name, type: String
  property :cost, type: Float



end
