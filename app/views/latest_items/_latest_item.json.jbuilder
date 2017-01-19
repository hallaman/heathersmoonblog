json.extract! latest_item, :id, :title, :link, :show, :image, :created_at, :updated_at
json.url latest_item_url(latest_item, format: :json)