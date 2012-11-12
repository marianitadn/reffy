TeamX::Application.routes.draw do
  
  match 'users/:id/show_all_games', to: 'application#show_all_user_games', via: :get, action: 'show_all_user_games'
  match 'users/:id/sports', to: 'users#user_sports', via: :get, action: 'user_sports'
  
  match 'teams/:id/show_all_games', to: 'application#show_all_games', via: :get, action: 'show_all_games' 
  match 'teams/:id/count_all_games', to: 'application#count_all_games', via: :get, action: 'count_all_games' 
  match 'teams/:id/team_score', to: 'application#count_team_score', via: :get, action: 'count_team_score' 
  match 'teams/:id/team_rating', to: 'application#team_rating', via: :get, action: 'team_rating' 
 
  match 'statistics/every_game', to: 'statistics#every_team_games', via: :get, action: 'every_team_games' 
  match 'statistics/every_team_details', to: 'statistics#every_team_details', via: :get, action: 'every_team_details' 
  
  match 'games/show_on_games', to: 'games#show_on_games', via: :get, action: 'show_on_games' 
  resources :games

  resources :sports

  resources :teams 

  resources :team_games

  resources :team_players

  resources :tournaments

  resources :tournament_games

  resources :users
  
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
