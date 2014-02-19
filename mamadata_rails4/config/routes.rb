MamadataRails4::Application.routes.draw do

  get 'families/addpeople', to: 'families#addpeople'
  put 'families/create', to: 'families#create'
  resources :families do
    resources :community_developments
  end
  delete 'families/:id/edit', to: 'families#delete_relation', as: :delete_family_relation

  put 'people/create', to: 'people#create'
  put 'people/search', to: 'people#search'

  resources :benefit_incidents, only: [:show, :edit, :index, :create, :update, :destroy]
  resources :person_godfather_files, only: [:create, :destroy, :edit]
  get 'person_godfather_files/new/:id', to: 'person_godfather_files#new', as: :new_person_godfather_file
  get 'person_godfather_files/:id/getfile', to: 'person_godfather_files#getfile', as: :get_godfather_file

  get 'benefit_incidents/test/calculated', to: 'benefit_incidents#calculated'
  get 'benefit_incidents/add_user_to_program/:person_id', to: 'benefit_incidents#add_user_to_program', as: :add_user_to_program
  get 'benefit_incidents/list/:person_id', to: 'benefit_incidents#list', as: :benefit_incidents_list
  get 'benefit_incidents/new/:person_id', to: 'benefit_incidents#new', as: :new_benefit_incident

  get 'people/:id/add_to_program/', to: 'people#add_to_program', as: :add_to_program

  resources :schools, only: [:show, :edit, :index, :create, :update, :destroy]
  get 'people/:id/schools/new', to: 'schools#new', as: :new_school
  get 'schools/:id/terminate', to: 'schools#terminate', as: :terminate_school

  resources :school_classes, only: [:show, :edit, :index, :create, :update, :destroy]
  get 'people/:id/schools/:school_id/classes/new', to: 'school_classes#new', as: :new_school_class
  get 'school_classes/:id/document', to: 'school_classes#document', as: :document_school_class

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
  resources :people do
    resources :journals
  end
  resources :supporters

  root 'people#index'

  devise_for :users, :skip => [:registrations]                                          
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
    end
  resources :users

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
