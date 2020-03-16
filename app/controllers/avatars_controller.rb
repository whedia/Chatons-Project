class AvatarsController < ApplicationController
  def create
    @user = current_user
    # .attach(params[:avatar])
    #avatar = params.permit(:avatar)


    puts "-" * 30
    #puts params.require(:avatar).class
    puts params[:avatar].class
    puts "-" * 30

    @user.avatar.attach(params[:avatar])

    redirect_to(edit_user_registration_path)
  end
end
