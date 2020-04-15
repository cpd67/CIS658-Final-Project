Rails.application.routes.draw do
  resources :users do
    resources :expenses
    resources :categories
  end
end
