class Album < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
 
    def self.find_by_album_title(album_title)
        self.where(album_title: album_title)
    end

    def self.find_by_creation_year(creation_year)
        self.where(creation_year: creation_year)
    end

    def self.find_by_genre(genre)
        self.where(genre: genre)
    end

    def print_artists_names
        self.artists.uniq.each {|artist_instance| puts artist_instance.name}
    end 
    # def album_songs
    #     self.songs.map {|song_instance| song_instance.album_title}
    # end 

    


end # of class 

