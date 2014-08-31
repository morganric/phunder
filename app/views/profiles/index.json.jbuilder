json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :bio, :image, :image_url, :date_of_birth, :location, :website
  json.url profile_url(profile, format: :json)
end
