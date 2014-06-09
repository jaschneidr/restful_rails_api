class DomainsController < ApplicationController
	include ActionController::MimeResponds
	before_action :fetch_domain, only: [:show, :update, :destroy]

	# Fetch the domain
	def fetch_domain
		@domain = Domain.find_by_id(params[:id])
	end

	# List an index of all domains belonging to a particular account
	def index
		@domains = Domain.all
		respond_to do |format|
			format.json { render json: @domains }
		end
	end

	# View a single domain
	def show
		return status 404 if @domain.nil?
		respond_to do |format|
			format.json { render json: @domain }
		end
	end

	# Create a new Domain
	def create
		@domain = Domain.new(:hostname => params[:hostname])

		# Attempt to save the domain, and return the appropriate JSON or Error
		respond_to do |format|
			if @domain.save
				format.json { render json: @domain, status: :created }
			else
				format.json { render json: @domain.errors, status: :unprocessable_entity }
			end
		end
		
		# Fetch the hostname IP address and update the record in a new thread
		t1=Thread.new{fetch_origin_ip()}
		t1.join
	end

	# Update a domain record
	def update
		respond_to do |format|
			if @domain.update_attributes(:hostname => params[:hostname])
				format.json { head :no_content, status: :ok }
			else
				format.json { render json: @domain.errors, status: :unprocessable_entity }
			end
		end

		# Fetch the hostname IP address and update the record in a new thread
		t1=Thread.new{fetch_origin_ip()}
		t1.join
	end

	# Delete a domain record
	def destroy
		respond_to do |format|
			if @domain.destroy
				format.json { head :no_content, status: :ok }
			else
				format.json { render json: @domain.errors, status: :unprocessable_entity }
			end
		end
	end


	##############################################################################
	private

	def fetch_origin_ip
		@domain.origin_ip_address = Resolv.getaddress @domain.hostname
		@domain.save
	end
	
end
