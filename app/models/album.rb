class Album < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
    # def find_by_album_title(album_title)
    #     self.all.each do |album_instance|
    #         puts "#{album_instance}"
    #     end
    # end

    # def find_by_creation_year(creation_year)
    #     self.all.select do |album_instance|
    #         album_instance.creation_year == self
    #     end
    # end

    # def find_by_genre(genre)
    #     self.all.select do |album_instance|
    #         album_instance.genre == self
    #     end
    # end

end # of class 

