class User < ActiveRecord::Base
  validates_presence_of :handle, :name, :email, :provider, :omniauth_id
end
