require 'jwt'
module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = ENV['RAILS_SECRET_KEY']

  def jwt_endcode(payloade, exp = 1.mintues.from_now.to_i)
    payloade[:exp] = exp
    JWT.encode(payloade, SECRET_KEY)
  end

  def jwt_decode(token)
    JWT.decode(token, SECRET_KEY)[0]
  end
end
