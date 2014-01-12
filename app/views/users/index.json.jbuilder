json.array!(@users) do |user|
  json.extract! user, :id, :email, :status
  json.url user_url(user, format: :json)
end
