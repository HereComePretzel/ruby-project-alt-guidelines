class Artist < ActiveRecord::Base
    has_many :songs
    has_many :albums, through: :songs
    
    def self.find_by_artist_name(artist_name)
        self.where(name: artist_name)
    end
    
end 

