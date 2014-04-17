class DiscourseSsoController < ApplicationController
  def sso
    secret = "MGqJGdrr2ZdEZfpRdLaCyxftYpP3Zu"
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email
    sso.name = current_user.name
    sso.username = current_user.handle
    sso.external_id = current_user.id
    sso.sso_secret = secret

    redirect_to sso.to_url("http://l.discourse/session/sso_login")
  end
end
