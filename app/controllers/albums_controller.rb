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
      @album = Album.new(name: json["items"][index]["album"]["name"], 
                        spotify_id: json["items"][index]["album"]["id"],
                        spotify_url: json["items"][index]["album"]["external_urls"]["spotify"],
                        image_url: json["items"][index]["album"]["images"][0]["url"],
                        large_image_url: json["items"][index]["album"]["images"][1]["url"],
                        upc_code: json["items"][index]["album"]["external_ids"]["upc"],
                        release_date: json["items"][index]["album"]["release_date"])
      @album.save
      user_album = @album.user_albums.build
      user_album.user_id = current_user.id
      user_album.save
      
      json["items"][index]["album"]["tracks"]["items"].count.to_i.times do |track|
        @track = Track.new(spotify_name: json["items"][index]["album"]["tracks"]["items"][track]["name"],
                          spotify_id: json["items"][index]["album"]["tracks"]["items"][track]["id"],
                          preview_url: json["items"][index]["album"]["tracks"]["items"][track]["preview_url"],
                          duration_ms: json["items"][index]["album"]["tracks"]["items"][track]["duration_ms"])
        @track.save
        album_track = @album.album_tracks.build
        album_track.track_id = @track.id
        album_track.save
        

        json["items"][index]["album"]["tracks"]["items"][track]["artists"].each do |external_url|
          debugger
          artist = Artist.new(spotify_name: external_url["name"],
                spotify_id: external_url["id"],
                spotify_url: external_url["spotify"])
          debugger
          artist.save
          related_track = @track.related_tracks.build
          related_track.artist_id = artist.id
          related_track.save
        end


        # 1.upto(json["items"][index]["album"]["tracks"]["items"][track]["artists"].count) do |number|
        #   debugger
        #   artist = Artist.new(spotify_name: json["items"][index]["album"]["tracks"]["items"][track]["artists"][number]["name"],
        #         spotify_id: json["items"][index]["album"]["tracks"]["items"][track]["artists"][number]["id"],
        #         spotify_url: json["items"][index]["album"]["tracks"]["items"][track]["artists"][number]["external_urls"]["spotify"])
        #   debugger
        #   artist.save
        #   related_track = @track.related_tracks.build
        #   related_track.artist_id = artist.id
        #   related_track.save
        # end
      end

      json["items"][index]["album"]["artists"].count.to_i.times do |artist|
        @artist = Artist.new(spotify_name: json["items"][index]["album"]["artists"][artist]["name"],
                  spotify_id: json["items"][index]["album"]["artists"][artist]["id"],
                  spotify_url: json["items"][index]["album"]["artists"][artist]["external_urls"]["spotify"]
                  )
        @artist.save
        related_track = @album.related_tracks.build
        related_track.artist_id = @artist.id
        related_track.save
      end
    end
    redirect_to user_albums_path
  end

  def show
  end
end
