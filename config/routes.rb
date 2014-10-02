Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resource :session, only: [:new, :create, :destroy]

  #root  'static#index'
  root    'users#new'

  # get   'users/' =>         'users#index', as: :users

  # post  'users/' =>         'users#create'

  # get   'users/new' =>      'users#new', as: :new_user #allows us to have a new_user_path variable

  # get   'users/:id' =>      'users#show', as: :user

  # get   'users/:id/edit' => 'users#edit'

  # patch 'users/:id' =>      'users#update'

  # delete 'users/:id' =>     'users#destroy'

  resources :users

  # resources :places

  get 'places/' =>          'places#index'
  
  post   'places/' =>       'places#create'

  get   'places/new' =>     'places#new', as: :new_place

  get   'places/:id/edit' =>'places#edit', as: :edit_place

  get 'places/:id' =>       'places#show', as: :place

  patch 'places/:id'  =>    'places#update'

  delete 'places/:id' =>    'places#destroy'

  get   'home/'     =>      'home#index', as: :home

end
