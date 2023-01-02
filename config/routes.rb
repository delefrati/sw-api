Rails.application.routes.draw do
  get :planets, to: "planets#index"
  get "planets/{id}", to: "planets#show"
  delete "planets/{id}", to: "planets#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
