json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :cost
  json.url dish_url(dish, format: :json)
end
