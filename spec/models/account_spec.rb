require 'spec_helper'

describe Account do
	before { @account = Account.new(name: "Fubar John") }
	subject { @account }

	it { should respond_to(:name) }
	it { should respond_to(:domains) }
	it { should be_valid }

	describe "When account name is not present" do
		before { @account.name = " " }
		it { should_not be_valid }
	end

	describe "When account name is already taken" do
		before do
			account_with_same_name = @account.dup
			account_with_same_name.save
		end
		it { should_not be_valid }
	end
end
