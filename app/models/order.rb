class Order
  include Neo4j::ActiveNode
  property :name, type: String
  property :created, type: Date
  property :delivered, type:Boolean, default: false

end
