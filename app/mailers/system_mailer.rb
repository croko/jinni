class SystemMailer < ApplicationMailer

  def new_user_registered(user)
    @user = user

    mail(subject: "Зарегистрировался #{@user.fio}")  do |format|
      format.html
    end
  end

  def new_project_registered(project)
    @project = project

    mail(subject: "Новый проект #{@project.title}")  do |format|
      format.html
    end
  end

  def new_project_published(project)
    @project = project

    mail(subject: "Опубликован новый проект #{@project.title}")  do |format|
      format.html
    end
  end
end
