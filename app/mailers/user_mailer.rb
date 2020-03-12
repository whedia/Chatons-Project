class UserMailer < ApplicationMailer
  default from: 'solunacisv@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://monsite.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def user_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Commande bien passée !')
  end
end
