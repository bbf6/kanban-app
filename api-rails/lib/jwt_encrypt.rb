module JwtEncrypt
  def encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def decode
    return nil unless header
    token = header.split(' ').last
    JWT.decode(token, SECRET_KEY)
  rescue JWT::DecodeError
    return nil
  end

  private

  SECRET_KEY = ENV['JWT_SECRET_KEY']

  def header
    request.header['Authorization']
  end
end
