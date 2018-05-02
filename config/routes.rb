Rails.application.routes.draw do
  resources :companies do 
    collection { post :import }
  end

  resources :companies, only: :index
  
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  get 'welcome/faq'
  get 'welcome/pricing'
  get 'welcome/features'
  
  resources :invoices

  root to: 'welcome#index'
end
