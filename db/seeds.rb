# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
	event = Event.create( name: "Event #{i}", date: "#{Time.now + i.days}", description: "Description #{i}")

	5.times do |j|
		spending_pool = SpendingPool.new( source: "Source #{j}", amount: 1000 + j, description: "Spending #{j}" )
		event.spending_pools << spending_pool
	end

	5.times do |j|
		expense = Expense.new( total: 500 + j, description: "Expense description #{j}", due_date: "#{Time.now + j.months}")

		5.times do |k|
			payment = Payment.new( amount: 250 + k, description: "Payment description #{k}", date: "#{Time.now + k.days}" )
			expense.payments << payment
		end

		event.expenses << expense
	end

	event.save!
end