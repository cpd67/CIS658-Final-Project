Rails.application.routes.draw do
  # Agile Web Development with Rails 6 by Sam Ruby & Dave Bryant Copeland
  # https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2
  controller :sessions do
    post 'login' => :create
    delete 'logout' => :destroy
    get '/logged_in' => :is_logged_in?
  end
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users, only: [:create, :show, :update, :destroy] do
    resources :expenses
    resources :categories
  end
end
