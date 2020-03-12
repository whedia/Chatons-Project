class UserMailer < ApplicationMailer
  default from: 'solunacisv@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://petits-chatons-by-lyon-thp.herokuapp.com/users/sign_in'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def user_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Commande bien passée !')
  end
end
