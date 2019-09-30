Rails.application.routes.draw do
  resources :student_current_borrow_lists
  resources :hold_lists
  resources :wish_lists
  resources :library_book_lists
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
