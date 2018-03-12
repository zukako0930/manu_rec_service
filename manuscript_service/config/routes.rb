Rails.application.routes.draw do
  resources :manuscripts
  root to: 'manuscripts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'view/show_result'
end
