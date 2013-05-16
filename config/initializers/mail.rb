if AppConfig.mail.enable?
	ActionMailer::Base.delivery_method = :smtp
	ActionMailer::Base.smtp_settings = {
	  :address => AppConfig.mail.smtp.host,
	  :port => AppConfig.mail.smtp.port,
	  :domain => AppConfig.mail.smtp.domain,
	  :user_name => AppConfig.mail.smtp.username,
	  :password => AppConfig.mail.smtp.password,
	  :authentication => AppConfig.mail.smtp.authentication,
	  :enable_starttls_auto => AppConfig.mail.smtp.enable_starttls_auto
	}
end