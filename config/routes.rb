Rails.application.routes.draw do
    namespace :users do
        get 'contacts/new'
        post 'contacts/upload'
        post 'contacts/import'
    end
    
    resources :users

    get    'sign_in', to: 'sessions#new'
    post   'sign_in', to: 'sessions#create'
    delete 'sign_out', to: 'sessions#destroy'

    root 'sessions#new'
end
