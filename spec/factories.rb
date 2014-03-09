require 'factory_girl'

FactoryGirl.define do
  sequence :id do |n|
    n
  end

  sequence :source do |n|
    "source#{n}"
  end

  sequence :amount do |n|
    100.0 + n + 0.55
  end

  sequence :description do |n|
    "description#{n} explains everything clearly"
  end

  sequence :received_on do |n|
    Time.now + n.weeks
  end

  sequence :due_date do |n|
    Time.now + n.months
  end

  sequence :date do |n|
    Time.now + n.days
  end

  factory :event do
    sequence(:name) { |n| "event#{n}" }

    # makes it so attributes are available on our factory
    ignore do
      spending_pools_count 5
      expenses_count 5
    end

    after(:create) do |event, evaluator|
      create_list(:expense, evaluator.expenses_count, event: event)
      create_list(:spending_pool, evaluator.spending_pools_count, event: event)
    end
  end

  factory :spending_pool do
    source
    amount
  end

  factory :expense do
    description
    due_date

    # makes it so attributes are available on our factory
    ignore do
      payments_count 5
    end

    after(:create) do |expense, evaluator|
      create_list(:payment, evaluator.payments_count, expense: expense)
    end
  end

  factory :payment do
    amount
    description
  end
end
