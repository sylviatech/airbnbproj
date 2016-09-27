class TransactionsController < ApplicationController

	def create
     @reservation = Reservation.find(params[:reservation_id])
     @listing = @reservation.listing
	   @result = Braintree::Transaction.sale(
              amount: @listing.price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      redirect_to reservations_path, notice: "Congratulations! Your transaction has been successfully made!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"

      gon.client_token = generate_client_token
      render :new
    end
  end

end
