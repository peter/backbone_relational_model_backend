BackboneRelationalModelBackend::Application.routes.draw do
  resources :categorizations
  resources :categories
  resources :posts
  resources :blogs
end
