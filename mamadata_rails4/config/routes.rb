MamadataRails4::Application.routes.draw do

  get 'families/addpeople', to: 'families#addpeople'
  put 'families/create', to: 'families#create'
  put 'people/create', to: 'people#create'
  put 'people/search', to: 'people#search'

  resources :benefit_incidents, only: [:show, :edit, :index, :create, :update]

  get 'benefit_incidents/list/:person_id', to: 'benefit_incidents#list', as: :benefit_incidents_list
  get 'benefit_incidents/new/:person_id', to: 'benefit_incidents#new', as: :new_benefit_incident

  resources :benefits do
    member do
      get :programs
    end
  end

  resources :programs do
    member do
      get :benefits
    end
  end

  resources :community_developments
  resources :families
  resources :roles
  resources :people
  resources :supporters

  root 'people#index'

  devise_for :users, :skip => [:registrations]                                          
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
    end

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
