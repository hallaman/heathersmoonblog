json.extract! podcast_detail, :id, :title, :image, :link, :reading, :podcast_id, :created_at, :updated_at
json.url podcast_detail_url(podcast_detail, format: :json)