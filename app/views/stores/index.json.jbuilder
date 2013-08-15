json.array!(@stores) do |store|
  json.extract! store, :name, :address, :lock_version
  json.url store_url(store, format: :json)
end
