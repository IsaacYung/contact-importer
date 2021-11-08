Rails.application.routes.draw do
  get 'contacts/new'
    resources :users

    get    'sign_in', to: 'sessions#new'
    post   'sign_in', to: 'sessions#create'
    delete 'sign_out', to: 'sessions#destroy'

    root 'sessions#new'
end
