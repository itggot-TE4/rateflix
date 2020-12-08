module AuthHelpers

  def sign_up(user)
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post '/api/v1/signup',
      params: { email: user[:email],
                password: user[:password],
                password_confirmation: user[:password] }
  end

  def auth_tokens_for_user(user)
    # All user fixtures should use email as password
    post '/api/v1/login',
      params: { email: user[:email], password: user[:email] }
    # The three categories below are the ones you need as authentication headers.
    response.headers.slice('Authorization', 'client', 'access-token', 'uid')
  end

end
