class MapsController < ApplicationController
  def index
    if params[:mapsearch].present?
      @listing = Geocoder.search(params[:mapsearch]).first
      @lat = @listing.data['geometry']['location']['lat']
      @lng = @listing.data['geometry']['location']['lng']
      @p = Property.near(params[:mapsearch], 20)
    else
      @lat = 41.901695
      @lng = -87.7094092
      @p = Property.all
    end
  end

  # def some_func_that_does_both_html_and_json
  #   respond_to do |format|
  #     format.html do
  #       # code to render html page
  #     end
  #     format.json do
  #       # code to render json
  #     end
  #   end
  # end

  def create_property
    @p = Property.create(address: params[:address], state: params[:state], city: params[:city])
    redirect_to '/'
  end

  # def search
  #   @p = Property.near(params[:mapsearch], 10)
  # end

  def properties_json
    if params[:mapsearch].present?
      @p = Property.near(params[:mapsearch], 10)
    else
      @p = Property.all
    end
    render json: @p.to_json
  end

end
