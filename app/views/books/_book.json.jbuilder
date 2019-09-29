json.extract! book, :id, :isbn, :title, :is_special_collection, :created_at, :updated_at
json.url book_url(book, format: :json)
