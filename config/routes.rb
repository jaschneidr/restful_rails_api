RestfulRailsApi::Application.routes.draw do
	
	namespace :api, defaults: { format: 'json' } do
		resources :accounts do
		       resources :domains
		end
	end

end
