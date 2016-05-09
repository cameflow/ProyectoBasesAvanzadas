class InStock
  include Neo4j::ActiveRel
  from_class :Ingredient
  to_class :Subingredient

  type 'IN_STOCK'

  property :isActive, type: Boolean
end
