class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(user.reset_password_token)
    mail(to: user.email,
         subject: "Запрос на изменение пароля")
  end

  def welcome_email(user)
    @user = user
    if user.email.present?
      mail(to: user.email,
           subject: "Приветствуем на Jinni")
    end
  end
end
