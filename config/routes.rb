Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :courses
  resources :users
  resources :tutors
  get '/courses_with_tutors', to: 'courses#fetch_with_tutors'
end
