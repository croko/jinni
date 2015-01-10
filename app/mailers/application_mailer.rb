class ApplicationMailer < ActionMailer::Base
  default from: "jinni.info@gmail.com",
          to: 'inna.kudelya@gmail.com',
          bcc: 'gennady.kidelya@gmail.com'

  # layout 'mailer'
end
