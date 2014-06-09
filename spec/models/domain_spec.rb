require 'spec_helper'

describe Domain do
	before { @domain = Domain.new(hostname: "www.apple.com") }
	subject { @domain }

	it { should respond_to(:hostname) }
	it { should respond_to(:origin_ip_address) }
	it { should respond_to(:account) }
	it { should be_valid }

	describe "When hostname is not present" do
		before { @domain.hostname = " " }
		it { should_not be_valid }
	end

	describe "When hostname is already taken" do
		before do
			domain_with_same_hostname = @domain.dup
			domain_with_same_hostname.save
		end
		it { should_not be_valid }
	end
end
