Bookst::Application.routes.draw do
 
 resources :carts

  resources :line_items


  resources :orders



  match '/return'=>'carts#return'

  match '/notification' => 'orders#notification'

  match 'orders/:id/refund' => 'orders#refund', :as => 'refund'

  

match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'

  resources :announcements


  resources :stocks 


  resources :categories


  resources :books do 
    resources :comments
  end
  
  match 'book/search' => 'books#search' ,:as => 'book_search'




  authenticated :user do
    root :to => 'books#index'
  end
  root :to => "books#index"
devise_for :users 


  resources :users

end