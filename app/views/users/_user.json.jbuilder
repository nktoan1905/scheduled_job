json.extract! user, :id, :slackid, :name, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
