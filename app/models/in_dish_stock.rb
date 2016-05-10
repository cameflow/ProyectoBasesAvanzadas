class InDishStock
  include Neo4j::ActiveRel
  from_class :Dish
  to_class :Subdish

  type 'IN_STOCK'

  property :isActive, type: Boolean
end
