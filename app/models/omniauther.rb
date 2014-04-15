class Omniauther

  def self.authenticate(env_hash)
    User.find_or_initialize_by(provider: env_hash['provider'], omniauth_id: env_hash['uid'])
  end

end
