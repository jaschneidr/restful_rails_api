class API::AccountsController < ApplicationController
	include ActionController::MimeResponds
	before_action :fetch_account, only: [:show, :update, :destroy]

	# Fetch the account
	def fetch_account
		@account = Account.find_by_id(params[:id])
	end

	# List an index of all accounts
	def index
		@accounts = Account.all
		respond_to do |format|
			format.json { render json: @accounts }
		end
	end

	# Return one particular account
	def show
		return status 404 if @account.nil?
		respond_to do |format|
			format.json { render json: @account }
		end
	end

	# Create a new account
	def create
		@account = Account.new(:name => params[:name])
		respond_to do |format|
			if @account.save
				format.json { render json: @account, status: :created }
			else
				format.json { render json: @account.errors, status: :unprocessable_entity }
			end
		end
	end

	# Update an account
	def update
		respond_to do |format|
			if @account.update_attributes(:name => params[:name])
				format.json { head :no_content, status: :ok }
			else
				format.json { render json: @account.errors, status: :unprocessable_entity }
			end
		end
	end

	# Delete an account
	def destroy
		respond_to do |format|
			if @account.destroy
				format.json { head :no_content, status: :ok }
			else
				format.json { render json: @account.errors, status: :unprocessable_entity }
			end
		end
	end
end
