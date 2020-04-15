Rails.application.routes.draw do
  # Agile Web Development with Rails 6 by Sam Ruby & Dave Bryant Copeland
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users do
    resources :expenses
    resources :categories
  end
end
