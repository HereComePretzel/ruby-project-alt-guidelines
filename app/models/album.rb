class Album < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs
end 
#     def find_by_album_title(album_title)
#         self.all.select do |album_instance|
#             album_instance.album_title == self
#             binding.pry
#         end
#     end

#     def find_by_creation_year(creation_year)
#         self.all.select do |album_instance|
#             album_instance.creation_year == self
#         end
#     end

#     def find_by_genre(genre)
#         self.all.select do |album_instance|
#             album_instance.genre == self
#         end
#     end

#     def find_by_artist(artist)
#         self.all.select do |album_instance|
#             album_instance.name == self
#         end 
#     end 

# end # of class 

