json.extract! testimonial, :id, :title, :body, :image, :show, :created_at, :updated_at
json.url testimonial_url(testimonial, format: :json)