class UsersController < Clearance::UsersController

	def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully!"
      sign_in @user
      UserMailer.welcome_email(@user).deliver_now
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

 	private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :birthday, :email, :password, :avatar)
  end

end
