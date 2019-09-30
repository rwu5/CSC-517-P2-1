json.extract! borrow_history, :id, :library_id, :student_id, :book_id, :created_at, :updated_at
json.url borrow_history_url(borrow_history, format: :json)
