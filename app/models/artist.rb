class Artist < ActiveRecord::Base
    has_many :songs
    has_many :albums, through: :songs

    def album_names
        self.albums.map {|album_instance| album_instance.album_title}
    end 

    def album_genres
        self.albums.map {|album_instance| album_instance.genre}
    end 
end 

