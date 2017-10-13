class AlbumsController < ApplicationController
  
  def index
    
  end  

  def fetch
    uri = URI.parse("https://api.spotify.com/v1/me/albums")
    request = Net::HTTP::Get.new(uri.to_s)
    request["Accept"] = "application/json"
    request["Authorization"] = "Bearer #{current_user.token}"
    req_options = { use_ssl: uri.scheme == "https" }
    
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    json = JSON.parse(response.body)
    json["items"].count.to_i.times do |index| 
      debugger
      @album = current_user.albums.build(name: json["items"][index]["album"]["name"], 
                        spotify_id: json["items"][index]["album"]["id"],
                        release_date: json["items"][index]["album"]["release_date"], image: json["items"][index]["album"]["images"][1]["url"])
      @album.save
  
      json["items"][index]["album"]["tracks"]["items"].count.to_i.times do |track|      
        @track = @album.tracks.build
        @track.name = json["items"][index]["album"]["tracks"]["items"][track]["name"]
        @track.spotify_id = json["items"][index]["album"]["tracks"]["items"][track]["id"]
        @track.save
      end

      json["items"][index]["album"]["artists"].count.to_i.times do |artist|
        @artist = @album.artists.build
        @artist.name = json["items"][index]["album"]["artists"][artist]["name"]
        @artist.spotify_id = json["items"][index]["album"]["artists"][artist]["id"]
        @artist.save
      end
    end
    redirect_to user_albums_path
  end

  def show
  end
end
