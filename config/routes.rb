Rails.application.routes.draw do
  root :to => "squirrels#index"
  resources :squirrels
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
