Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resource :session, only: [:new, :create, :destroy]

  root    'users#new'

  resources :users

  # resources :places

  get 'places/' =>          'places#index'
  
  post   'places/' =>       'places#create'

  get   'places/new' =>     'places#new', as: :new_place

  get   'places/:id/edit' =>'places#edit', as: :edit_place

  get 'places/:id' =>       'places#show', as: :place

  patch 'places/:id'  =>    'places#update'

  delete 'places/:id' =>    'places#destroy'


end
