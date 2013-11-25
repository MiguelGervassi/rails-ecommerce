json.array!(@photos) do |photo|
  json.extract! photo, :gallery_id_id
  json.url photo_url(photo, format: :json)
end