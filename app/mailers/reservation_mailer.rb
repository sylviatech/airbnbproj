class ReservationMailer < ApplicationMailer

	def reservation_email(user_id)
		@user = User.find(user_id)

		mail(to: @user.email,
			subject: 'Your holiday is booked') do |format|
			format.html { render 'reservation_email' }
			format.text { render text: 'reservation_mail'}
		end
	end

	def new_booking(customer_id, user_id)
		@customer = User.find(customer_id)
		@host = User.find(user_id)

		mail(to: @host.email,
			subject: 'Yay! You have new customers!') do |format|
			format.html { render 'new_booking' }
			format.text { render text: 'new_booking'}
		end
	end
end
