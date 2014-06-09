class Account < ActiveRecord::Base
	has_many :domains, dependent: :destroy
	validates :name, presence: true, length: { maximum: 100 }

	private
	def account_params
		params.required(:name)
	end

end
