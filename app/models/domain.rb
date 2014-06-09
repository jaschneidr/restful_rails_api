class Domain < ActiveRecord::Base
	belongs_to :account
	validates :hostname, presence: true
	validates :origin_ip_address, length: { maximum: 45 }
end
