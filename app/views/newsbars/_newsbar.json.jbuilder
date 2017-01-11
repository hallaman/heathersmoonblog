json.extract! newsbar, :id, :message, :show, :created_at, :updated_at
json.url newsbar_url(newsbar, format: :json)