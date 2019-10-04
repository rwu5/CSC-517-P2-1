Rails.application.routes.draw do
  resources :wish_lists
  resources :library_book_lists
  resources :borrow_histories
  resources :hold_lists
  resources :student_current_borrow_lists
  devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
  }
  resources :books
  resources :libraries
  resources :universities
  devise_for :students, controllers: {
      registrations: 'students/registrations',
      sessions: 'students/sessions'
  }
  root to: 'home#index'

  get 's/libraries', to: 'student_page#show_libraries'
  get 's/books', to: 'student_page#show_books'
  get 's/books/:id', to: 'student_page#book_details'
  get 's/wish_list', to: 'student_page#wish_list'

  post 's/wish_list/:id', to: 'student_page#add_to_wish_list'
  post 's/books/:id', to: 'student_page#borrow_book'
  delete 's/wish_list/:id', to: 'student_page#remove_from_wish_list'

  get 's/current_borrowed_list', to: 'student_page#current_borrowed_list'
  delete 's/current_borrowed_list/:id', to: 'student_page#return_book'

  get 's/request_list', to: 'student_page#request_list'
  delete 's/request_list/:id', to: 'student_page#remove_from_request_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
