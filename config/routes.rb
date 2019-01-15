Rails.application.routes.draw do
  get    'signup'  => 'users#new'
  resources :users
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post   'todos' => 'todos#create'
  delete  'todos/:id' => 'todos#destroy', as: 'todo_delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
