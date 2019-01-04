Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "liuzechu2013@gmail.com"
  config.rotate_csrf_on_sign_in = true
  config.redirect_url = "/tasks"
end
