json.array!(@galleries) do |gallery|
  json.extract! gallery, :product_id
  json.url gallery_url(gallery, format: :json)
end