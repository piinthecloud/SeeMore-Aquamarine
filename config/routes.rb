Rails.application.routes.draw do

  root 'home#index'

  get "auth/:provider/callback",        to: "sessions#create"

  delete "/",                           to: "sessions#destroy",  as: :logout

  #MY ACCOUNT
  get   "/my_account",                  to: "sessions#my_account",    as: :my_account

  # TWITTER
  get   "/search/twitter",              to: "twitter#search"
  post  "/feeds/twitter/:screen_name",  to: "subscriptions#subscribe", as: :feed
  get   "/search/twitter",              to: "twitter#search"
  get   "/feeds/twitter/:handle",       to: "subscriptions#subscribe"

  #VIMEO

  get "/vimeos/search_vimeo",           to: "vimeos#search_vimeo"
  post "/vimeos/search_vimeo",          to: "vimeos#search_vimeo"
  post "/vimeos/",                      to: "vimeos#create_vimeo_feed", as: :create_vimeo_feed
  delete "/vimeos/:id",                 to: "vimeos#delete_vimeo_feed", as: :delete_vimeo_feed

  #GITHUB
  get "/github/search_github",           to: "github#search_github"
  post "/github/search_github",          to: "github#search_github"
  post "/github/",                       to: "github#create_github_feed", as: :create_github_feed
  delete "github/:id",                   to: "github#delete_github_feed", as: :delete_github_feed



  # INSTAGRAM
  get "/instagram/search"                  ,to: "instagram#search"
  post"/instagram/search"                  ,to: "instagram#search"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
