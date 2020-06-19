json.extract! product, :id, :name, :description, :price, :availability, :img_url, :created_at, :updated_at
json.url product_url(product, format: :json)
