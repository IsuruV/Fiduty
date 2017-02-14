Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  # config.omniauth :facebook, '1023463931115178', 'a17cf83784ecebce64a98e8b8ea98ad5', :strategy_class => OmniAuth::Strategies::Facebook
  config.omniauth :facebook, '228025157667481', '5ae25ba5ef16d8cb69112d051933cb90', :strategy_class => OmniAuth::Strategies::Facebook
 # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete
  # config.action_mailer.delivery_method = :smtp

  # config.action_mailer.smtp_settings = {
  #   :enable_starttls_auto => true,
  #   :address => "smtp.gmail.com",
  #   :port => 587,
  #   :domain => "gmail.com",
  #   :authentication => :login,
  # }

  # If using rails-api, you may want to tell devise to not use ActionDispatch::Flash
  # middleware b/c rails-api does not include it.
  # See: http://stackoverflow.com/q/19600905/806956
  config.navigational_formats = [:json]
end
