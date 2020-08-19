puts "deleting all instances"

Album.destroy_all
Artist.destroy_all
Song.destroy_all

#Album (title(s), creationyear(i), genre(s))
puts "seeding albums"
10.times do (
Album.create(album_title:Faker::Music.album, creation_year: rand(1950..2010), genre:Faker::Music.genre) 
)
end
Album.create(album_title:"Bilg", creation_year: 1999, genre: "Pop")
Album.create(album_title:"Supernatural", creation_year: 1999, genre: "Rock")

#Artist(name(s))
puts "seeding artists"
10.times do (
Artist.create(name:Faker::Music.band))
end

#Song(title(s), artistid(i), albumid(i))
puts "seeding songs"

100.times do (
Song.create(song_title:Faker::Books::Lovecraft.deity, artist_id: Artist.all.sample.id, album_id: Album.all.sample.id)
)
end
puts "seeding complete"
