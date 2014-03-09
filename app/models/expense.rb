class Expense < ActiveRecord::Base
  belongs_to :event
  has_many :payments, :dependent => :destroy
end
