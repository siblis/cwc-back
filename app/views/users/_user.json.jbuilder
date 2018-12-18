json.extract! user, :id, :login, :password, :email, :auth_token, :deleted, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)