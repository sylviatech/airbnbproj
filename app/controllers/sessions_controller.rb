class SessionsController < Clearance::SessionsController

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"] #<-- check if use authenticate object provide by fb

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash) #<-- else, it will created
    if authentication.user #<-- find '/model/authentication'; belongs to user...
      user = authentication.user  
      authentication.update_token(auth_hash)
      @next = root_url #<-- guide redirect to root_url
      @notice = "Signed in!" #<-- give explanation 'sgn in'
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash) 
      # @next = edit_user_path(user)   
      # @notice = "User created - confirm or edit details..."
          @next = root_url  
      @notice = "NEw User created"
    end
    sign_in(user)
      # redirect_to @next, flash[:notice] => @notice
    redirect_to @next, :notice => @notice #--> moder/user 
  end
end