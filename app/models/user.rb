class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :do_something
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
  has_one :cart, dependent: :destroy

=======
    has_one :cart, dependent: :destroy
  
    has_many :orders
    # has_many :order_items, through: :orders
>>>>>>> 48eb0d4eba4171f707098b81cc0f7c64367faf30

    # def do_something
    #   puts "#"*60
    #   puts "Done something"
    #   user_cart = Cart.create(user: current_user)
    #   flash[:notice] = "Cart created"
    # end
end
