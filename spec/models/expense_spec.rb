require 'spec_helper'

describe Expense do
	it { should respond_to :event }
	it { should respond_to :payments }

	describe 'a valid record' do
		before(:each) do
			@expense = FactoryGirl.create(:expense)
		end

		describe 'on destroy' do
			it 'should succeed' do
				expect { @expense.destroy }.to change(Expense, :count).by(-1)
			end

			it 'remove associated payments' do
				size = @expense.payments.size*-1
				expect { @expense.destroy }.to change(Payment, :count).by(size)
			end
		end
	end
end