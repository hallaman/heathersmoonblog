json.extract! faq, :id, :title, :body, :created_at, :updated_at
json.url faq_url(faq, format: :json)