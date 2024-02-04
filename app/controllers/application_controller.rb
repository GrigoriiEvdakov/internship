require 'digest'

class ApplicationController < ActionController::API
  def authorize!
    raise 'Forbidden' if request.headers['X-Auth-Token'] != ENV['TOKEN']
  end

  def token
    token = Digest::SHA256.hexdigest('new token generate')
    token_add_to_env(token)
    token
  end

  def token_add_to_env(token)
    ENV['TOKEN'] = token
  end
end
