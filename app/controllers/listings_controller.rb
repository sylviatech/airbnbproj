class ListingsController < ApplicationController
  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag])
    else
      listings_per_page = 7
      params[:page] = 1 unless params[:page]
      first_listing = (params[:page].to_i - 1 ) * listings_per_page
      listings = Listing.all
      @total_pages = listings.count / listings_per_page
        if listings.count % listings_per_page > 0
          @total_pages += 1
        end
        @listings = listings[first_listing...(first_listing + listings_per_page)]
    end
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

  def search
    if params[:search][:name] != ""
      @listings = Listing.search(params[:search][:name])

    #   listings = Listing.search(params[:search][:name])
    #     listings.each do |listing|
    #     puts listing
    #     end
    # redirect_to search_path
    else
    #   listings = Listing.search.blank?
      redirect_to listings_path
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :content, :user_id, {avatar: []}, :guest, :tag_list, :price)
  end
end


 
 

