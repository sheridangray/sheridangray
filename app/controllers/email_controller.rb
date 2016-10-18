class EmailController < ApplicationController
  def test
    ses = AWS::SES::Base.new(
      access_key_id: Rails.application.secrets.AMAZON_ACCESS_KEY,
      secret_access_key: Rails.application.secrets.AMAZON_SECRET_KEY,
      server: Rails.application.secrets.AMAZON_EMAIL_SERVER_REGION
    )
    ses.send_email(
       :to        => ['sheridan.gray@gmail.com'],
       :source    => '"Wardrobe Depreciation Bot" <sheridan.gray@gmail.com>',
       :subject   => 'Subject Line',
       :text_body => 'Internal text body'
    )
    redirect_to root_path, notice: "Email sent!"
  end
end
