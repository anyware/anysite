require "development_mail_interceptor"
MAIL_CONFIG = YAML.load_file(  "#{Rails.root.to_s}/config/mail.yml" )[ ENV['RAILS_ENV'] || RAILS_ENV ] 
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => MAIL_CONFIG["domain"],
  :user_name            => MAIL_CONFIG["user_name"],
  :password             => MAIL_CONFIG["password"],
  :authentication       => 'plain',
  :enable_starttls_auto => true  }

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
