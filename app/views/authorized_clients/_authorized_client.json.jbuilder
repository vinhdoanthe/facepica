json.extract! authorized_client, :id, :client_name, :client_secret, :location, :created_at, :updated_at
json.url authorized_client_url(authorized_client, format: :json)
