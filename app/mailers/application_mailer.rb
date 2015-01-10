class ApplicationMailer < ActionMailer::Base
  default from: "jinni.info@gmail.com",
          to: 'inna.kudelya@gmail.com',
          bcc: 'gennady.kudelya@gmail.com'

  # layout 'mailer'
end
