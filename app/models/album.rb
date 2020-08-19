class Album < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
end 
    def find_by_album_title(album_title)
        self.select do |album_instance|
            album_instance.album_title == self
            #only returns first instance
        end
    end

    def find_by_creation_year(creation_year)
        self.all.select do |album_instance|
            album_instance.creation_year == self
            #only returns first instance
        end
    end

    def find_by_genre(genre)
        self.all.select do |album_instance|
            album_instance.genre == self
            #only returning first instance
        end
    end

    def find_by_artist(artist)
        self.all.select do |album_instance|
            album_instance.artist == self
            #does not work
        end 
    end 

# end # of class 

