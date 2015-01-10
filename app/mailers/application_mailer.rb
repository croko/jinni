class ApplicationMailer < ActionMailer::Base
  default from: "noreply@jinni.com.ua"
  default to: 'inna.kudelya@gmail.com'
  default bcc: 'gennady.kidelya@gmail.com'

  # layout 'mailer'
end
