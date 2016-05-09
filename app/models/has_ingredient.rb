class HasIngredient
  include Neo4j::ActiveRel
  from_class :Recipe
  to_class :Ingredient

  type 'HAS_INGREDIENT'

  property :amount, type: Float
end
