class OrdersController < ApplicationController
  def new
    @cart = Cart.find(params[:id])
  end

  def create
    puts "#" * 300
      cart = Cart.find(params[:cart_id])
      total_price = cart.returnTotalPrice
      # Amount in cents
    @amount = total_price * 100

    customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken],
    })
    begin
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path(cart.id)
    end
        flash[:success] = "Votre paiement a fonctionné. Vous allez recevoir par mail les photos commandées. Merci pour votre achat!"
        items_ids_to_add = cart.to_a.map {|item| item.id }
        order = Order.new(user: current_user )
        items_ids_to_add.each do |item_id|
          order.items.push(Item.find(item_id))
        end
        order.save
        # use mailer to send photos
        redirect_to root_path
  end

end
