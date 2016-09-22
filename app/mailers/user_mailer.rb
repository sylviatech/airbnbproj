class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def welcome_email(user)
		@user = user
		mail(to: @user.email, 
			subject: 'Welcome to Airbnb') do |format|
			format.html { render 'welcome_email' }
			format.text { render text: 'welcome_mail'}
		end
	end
end
