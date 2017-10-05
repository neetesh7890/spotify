require 'net/http'
require 'uri'
require 'rspotify'



class DashboardsController < ApplicationController
  def index
    
    # artists = RSpotify::Artist.search('Arctic Monkeys')
    debugger
    # uri = URI.parse("https://api.spotify.com/v1/me/playlists")
    # request = Net::HTTP::Get.new(uri)
    # request["Accept"] = "application/json"
    # debugger
    # request["Authorization"] = "Bearer #{current_user.token}"

    # req_options = { use_ssl: uri.scheme == "https" }

    # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    #   http.request(request)
    # end
    # json = JSON.parse(response.body)
    
    

  end
end
