class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    gon.client_token = generate_client_token
    @reservation = Reservation.find(params[:id])
    @listing = @reservation.listing
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new(reservation_params)
      if @reservation.save
      flash[:success] = "Your holiday is now booked! Get your bags ready!👏"
      # ReservationMailer.reservation_email(@reservation.user).deliver_now
      customer_id = @reservation.user.id
      ReservationMailer.reservation_email(customer_id).deliver_later
      ReservationMailer.new_booking(customer_id, @listing.user.id).deliver_later

      redirect_to @reservation
    else
      render 'new'
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      flash[:success] = "Your reservation is now updated."
      redirect_to @reservation
    else
      render 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    redirect_to listings_path(id: @reservation.listing.id)
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end

  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :user_id, :listing_id, :guest)
  end
end