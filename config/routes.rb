Recipes::Application.routes.draw do
  match('/', {:via => :get, :to => 'recipes#index'})
  match('recipes', {:via => :get, :to => 'recipes#index'})
  match('recipes', {:via => :post, :to => 'recipes#create'})
  match('recipes/:recipe_slug', {:via => :get, :to => 'recipes#show'})
  match('recipes/:recipe_slug/edit', {:via => :get, :to => 'recipes#edit'})
  match('recipes/:recipe_slug', {:via => [:patch, :put], :to => 'recipes#update'})
  match('recipes/:recipe_slug', {:via => :delete, :to => 'recipes#destroy'})
  match('tags/new', {:via => :get, :to => 'tags#new'})
  match('recipes', {:via => :post, :to => 'tags#create'})
end


