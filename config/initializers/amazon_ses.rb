ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => Rails.application.secrets.ACCESS_KEY_ID,
  :secret_access_key => Rails.application.secrets.SECRET_ACCESS_KEY,
  :server => Rails.application.secrets.AMAZON_EMAIL_SERVER_REGION