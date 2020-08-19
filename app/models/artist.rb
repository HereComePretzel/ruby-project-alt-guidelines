class Artist < ActiveRecord::Base
    has_many :songs
    has_many :albums, through: :songs

    def self.find_by_artist(artist)
        self.all.each do |artist_instance|
            artist_instance.albums == self
        end 
            #album_instance.artist == self
            #does not work
         
    end 
end 

