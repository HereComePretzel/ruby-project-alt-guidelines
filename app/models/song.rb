class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :album

    def self.find_by_song_title(song)
        self.where(song_title: song)
    end 

    def album_songs
        self.album.each {|album_instance| album_instance.album_title}
    end

end 

