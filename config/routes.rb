Rails.application.routes.draw do
   controller :posts do
   	get '/new_post' => :new, as: 'new_post'
   	get '/post/:id' => :show, as: 'show_post'
   	post '/create_post' => :create, as: 'create_post'
   	get '/post/:id/edit' => :edit, as: 'edit_post'
   	patch '/post/:id/update' => :update, as: 'update_post'
   	delete '/post/:id/delete' => :destroy, as: 'destroy_post'
   end
   root 'posts#index'
      
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
