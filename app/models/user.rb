class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :do_something
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_one :cart, dependent: :destroy
    

    # def do_something
    #   puts "#"*60
    #   puts "Done something"
    #   user_cart = Cart.create(user: current_user)
    #   flash[:notice] = "Cart created"
    # end
end
