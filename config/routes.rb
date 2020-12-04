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
  get '/dashboard', to: 'pages#dashboard'
  post '/schedule_events/:id', to: 'schedule_events#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :schedules, only: [:index, :show, :edit, :update] do
    resources :events, only: [:index, :show]
    member do
      post :select
    end
  end

  resources :unavailable_days, only: [:create, :destroy]

  resources :events, only: :show do
    resources :schedule_events, only: :update
  end




  resources :recruits, except: [:new, :create]

  resources :athletes, only: [:index, :show] do
    resources :recruits, only: [:show, :new, :create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
