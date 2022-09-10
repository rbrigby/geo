class SearchesController < ApplicationController
  # GET /addresses or /addresses.json
  def index
    @geo_search = params[:geo_search]
    geo = set_geo(@geo_search)
    params[:miles].present? ? @miles = params[:miles] : @miles = 1

    respond_to do |format|
      if geo
        p geo
        lat = geo&.latitude
        lon = geo&.longitude
        p "lat: #{lat} - lon: #{lon}"
        addresses = Address.within(lat, lon, @miles.to_f)
        @addresses = addresses.paginate(page: params[:page], per_page: 30)
        format.html
      else
        format.html
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:searches).permit(:lat, :lng)
    end

    def set_geo(search)
      p "set_geo: #${search}"
      response = Geocoder.search(search)
      response&.first
    end
end
