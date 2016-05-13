class Subingredient
  include Neo4j::ActiveNode
  property :name, type: String
  property :amount, type: Float
  property :exp_date, type: Date
  property :valido, type: Boolean, default:true



end
