class ListingsController < ApplicationController
  def index
    @listings = Listing.all

  end

  def show
    @listing = Listing.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
  
    if @listing.save
      flash[:success] = "New listing created."
      redirect_to @listing
    else
      render 'new'
    end
  end

  def update
    @listing = Listing.find(params[:id])
 
    if @listing.update_attributes(listing_params)
      flash[:success] = "#{@listing.title} successfully created."
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
 
    redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :content, :user_id, {avatar: []}, :guest)
  end
end


 
 

