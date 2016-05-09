json.array!(@subingredients) do |subingredient|
  json.extract! subingredient, :id, :name, :amount, :exp_date
  json.url subingredient_url(subingredient, format: :json)
end
