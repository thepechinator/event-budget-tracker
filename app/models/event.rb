class Event < ActiveRecord::Base
	has_many :spending_pools, :dependent => :destroy
	has_many :expenses, :dependent => :destroy
end
