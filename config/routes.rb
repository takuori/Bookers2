Rails.application.routes.draw do
  get 'books/edit'
  get 'users/edit'
  get 'users/show'
  get 'books/new'
  get 'homes/top'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
