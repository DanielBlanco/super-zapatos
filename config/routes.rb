SuperZapatos::Application.routes.draw do

  root 'stores#index'
  resources :stores do 
    resources :articles
  end

  # Really weird REST design!
  namespace :services, defaults: {format: 'json'} do
    get 'stores' => 'stores#index'
    get 'articles/stores/:id' => 'articles#index_store'
    get 'articles' => 'articles#index'
    # TODO: add more...
  end
  
end
