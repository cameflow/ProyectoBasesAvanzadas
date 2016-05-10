json.array!(@subdishes) do |subdish|
  json.extract! subdish, :id, :name, :amount, :exp_date
  json.url subdish_url(subdish, format: :json)
end
