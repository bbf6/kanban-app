module UserSerializer
  def serialize(user)
    user.as_json(except: %i[id password_digest active created_at updated_at])
  end
end
