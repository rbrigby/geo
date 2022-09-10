Geocoder.configure(
  google_places_search: {
    api_key: 'AIzaSyA1b_0_WXXk-l2_S2ACTivkMrLAwE4F3nE',
    fields: %w[address_components adr_address business_status formatted_address geometry name
        photos place_id plus_code types url utc_offset vicinity],
    # locationbias: "point:-36.8509,174.7645"
    google_place_id: false
  }
)