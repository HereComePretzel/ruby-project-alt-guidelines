class Artist < ActiveRecord::Base
    has_many :songs
    has_many :albums, through: :songs

    # def albums
    #     self.albums.map do |key|
    #         key.album_title
    #     end
    # end
end 

