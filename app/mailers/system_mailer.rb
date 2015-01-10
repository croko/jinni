class SystemMailer < ApplicationMailer

  def new_user_registered(user)
    @user = user
    @bcc = 'gennady.kidelya@gmail.com'

    mail(bcc: @bcc, subject: "Зарегистрировался #{@user.fio}")  do |format|
      format.html
    end
  end

  def new_project_registered(project)
    @project = project
    @bcc = 'gennady.kidelya@gmail.com'

    mail(bcc: @bcc, subject: "Новый проект #{@project.title}")  do |format|
      format.html
    end
  end

  def new_project_published(project)
    @project = project
    @bcc = 'gennady.kidelya@gmail.com'

    mail(bcc: @bcc, subject: "Опубликован новый проект #{@project.title}")  do |format|
      format.html
    end
  end
end
