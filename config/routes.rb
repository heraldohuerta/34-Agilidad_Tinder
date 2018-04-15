Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

 get 'search', to: 'users#search'

 resource 'interactions', only: :create

 root 'users#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
