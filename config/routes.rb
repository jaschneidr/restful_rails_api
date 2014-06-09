RestfulRailsApi::Application.routes.draw do
	
  get "domains/new"
  get "accounts/new"
	namespace :api, defaults: { format: 'json' } do
		resources :accounts do
		       resources :domains
		end
	end

end
