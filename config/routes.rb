Rails.application.routes.draw do
  
  get 'post/new' => 'post#new'
  get 'user/new' => 'user#new'
  post 'user/new_entry' => 'user#new_entry'
  post 'post/create' => 'post#create'
  get 'post/:id/edit' => 'post#edit'
  get 'user/member' => 'user#member' #削除予定
  post 'user/:id/destroy' => 'user#destroy'
  get 'user/:id/destroy_form' => 'user#destroy_form'
  post 'logout' => 'user#logout'
  
  post 'post/:id/update' => 'post#update'
  post 'post/:id/destroy' => 'post#destroy'
  get 'post/:id/edit_form' => 'post#edit_form'

  get 'user/login_form' => 'user#login_form'
  get 'user/:id/edit_form' => 'user#edit_form'
  post 'user/:id/update' => 'user#update'

  get '/' => 'home#top'
  get 'post/show' => 'post#show'
  get 'login_form' => 'user#login_form'
  post 'login' => 'user#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
