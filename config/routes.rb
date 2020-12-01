Rails.application.routes.draw do
  # get 'calendars/index'
  # get 'calendars/show'
  # get 'calendars/edit'
  # get 'calendars/update'
  # get 'recruits/index'
  # get 'recruits/show'
  # get 'recruits/new'
  # get 'recruits/create'
  # get 'recruits/destroy'
  # get 'recruits/edit'
  # get 'recruits/update'
  # get 'athletes/index'
  # get 'athletes/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events, only: [:index, :show]

  resources :calendars, only: [:index, :show, :edit, :update]
  resources :recruits, except: [:new, :create]
  resources :athletes, only: [:index, :show] do
    resources :recruits, only: [:new, :create]
  end

end
