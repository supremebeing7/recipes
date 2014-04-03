Recipes::Application.routes.draw do
  match('/', {:via => :get, :to => 'recipes#index'})

  match('tags/new', {:via => :get, :to => 'tags#new'})
  match('tags', {:via => :post, :to => 'tags#create'})
  match('tags/:tag_slug', {:via => :get, :to => 'tags#show'})
  match('tags/:tag_slug/edit', {:via => :get, :to => 'tags#edit'})
  match('tags/:tag_slug', {:via => [:patch, :put], :to => 'tags#update'})
  match('tags/:tag_slug', {:via => :delete, :to => 'tags#destroy'})

  match('recipes', {:via => :get, :to => 'recipes#index'})
  match('recipes', {:via => :post, :to => 'recipes#create'})
  match('recipes/:recipe_slug', {:via => :get, :to => 'recipes#show'})
  match('recipes/:recipe_slug/edit', {:via => :get, :to => 'recipes#edit'})
  match('recipes/:recipe_slug', {:via => [:patch, :put], :to => 'recipes#update'})
  match('recipes/:recipe_slug', {:via => :delete, :to => 'recipes#destroy'})

end


