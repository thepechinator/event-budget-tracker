require 'spec_helper'

describe Event do
	it { should respond_to :spending_pools }
	it { should respond_to :expenses }

	describe 'a valid record' do
		before(:each) do
			@event = FactoryGirl.create(:event)
		end

		it 'should have spending pools' do
			@event.spending_pools.size.should > 0
		end

		it 'should have expenses' do
			@event.expenses.size.should > 0
		end

		describe 'on destroy' do
			it 'should succeed' do
				expect { @event.destroy }.to change(Event, :count).by(-1)
			end

			it 'remove associated expenses' do
				size = @event.expenses.size*-1
				expect { @event.destroy }.to change(Expense, :count).by(size)
			end

			it 'should remove associated spending pools' do
				size = @event.spending_pools.size*-1
				expect { @event.destroy }.to change(SpendingPool, :count).by(size)
			end
		end
	end
end