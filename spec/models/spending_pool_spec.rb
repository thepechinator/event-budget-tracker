require 'spec_helper'

describe SpendingPool do
	it { should respond_to :event }

	describe 'a valid record' do
		before(:each) do
			@spending_pool = FactoryGirl.create(:spending_pool)
		end

		describe 'on destroy' do
			it 'should succeed' do
				expect { @spending_pool.destroy }.to change(SpendingPool, :count).by(-1)
			end
		end
	end
end