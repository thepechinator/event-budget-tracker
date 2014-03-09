json.array!(@expenses) do |expense|
  json.extract! expense, :id, :total, :description, :due_date, :event_id
  json.url expense_url(expense, format: :json)
end
