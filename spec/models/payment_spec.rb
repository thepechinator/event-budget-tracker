require 'spec_helper'

describe Payment do
	it { should respond_to :expense }

	describe 'a valid record' do
		before(:each) do
			@payment = FactoryGirl.create(:payment)
		end

		describe 'on destroy' do
			it 'should succeed' do
				expect { @payment.destroy }.to change(Payment, :count).by(-1)
			end
		end
	end
end