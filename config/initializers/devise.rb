Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  # config.action_mailer.delivery_method = :smtp

  # config.action_mailer.smtp_settings = {
  #   :enable_starttls_auto => true,
  #   :address => "smtp.gmail.com",
  #   :port => 587,
  #   :domain => "gmail.com",
  #   :authentication => :login,
  #   :user_name => "isuru260@gmail.com",
  #   :password => "isuru491725"
  # }

  # If using rails-api, you may want to tell devise to not use ActionDispatch::Flash
  # middleware b/c rails-api does not include it.
  # See: http://stackoverflow.com/q/19600905/806956
  config.navigational_formats = [:json]
end
