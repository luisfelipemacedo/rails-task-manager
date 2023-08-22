Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # verb 'path', to: 'controller#action'

  # poderia ter feito todas essas routes com a linha abaixo:
  # resources :tasks


  # Read all tasks
  get 'tasks', to: 'tasks#index', as: :tasks # fez essa assinatura para voltar para lista principal

  # create a task
  get 'tasks/new', to: 'tasks#new', as: :new
  post 'tasks', to: 'tasks#create'

  # see one task
  get 'tasks/:id', to: 'tasks#show', as: :task # passa o id dinamico na url dependendo da task

  # Update
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit
  patch 'tasks/:id', to: 'tasks#update'

  # Delete
  delete 'tasks/:id', to: 'tasks#destroy'
end
