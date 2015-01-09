class SystemMailer < ApplicationMailer
  @admin_email = 'inna.kudelya@gmail.com'
  @cc = 'gennady.kidelya@gmail.com'

  def new_user_registered(user)
    @user = user

    mail(to: @admin_email, bcc: @cc, subject: "Зарегистрировался #{@user.fio}")  do |format|
      format.html
    end

  end

  def new_project_registered(project)
    @project = project

    mail(to: @admin_email, bcc: @cc, subject: "Новый проект #{@project.title}")  do |format|
      format.html
    end
  end

  def new_project_published(project)
    @project = project

    mail(to: @admin_email, bcc: @cc, subject: "Новый проект #{@project.title}")  do |format|
      format.html
    end
  end
end
