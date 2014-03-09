json.array!(@spending_pools) do |spending_pool|
  json.extract! spending_pool, :id, :source, :amount, :description, :received_on, :event_id
  json.url spending_pool_url(spending_pool, format: :json)
end
