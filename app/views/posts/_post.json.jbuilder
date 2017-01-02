json.extract! post, :id, :title, :body, :main_image, :category, :publish_date, :created_at, :updated_at
json.url post_url(post, format: :json)