puts "deleting all instances"

Album.destroy_all
Artist.destroy_all
Song.destroy_all

#Album (title(s), creationyear(i), genre(s))
puts "seeding albums"
# 10.times do (
# Album.create(album_title:Faker::Music.album, creation_year: rand(1950..2010), genre:Faker::Music.genre) 
# )
# end
Album.create(album_title: "What's the Story", creation_year: 1990, genre: "Rock")
Album.create(album_title: "Morning Glory", creation_year: 1991, genre: "Rock")
Album.create(album_title: "Be Here Now", creation_year: 1992, genre: "Rock")
Album.create(album_title: "D'YaKnow What I Mean?", creation_year: 1993, genre: "Rock")
Album.create(album_title: "Les Mis", creation_year: 1994, genre: "Musical")
Album.create(album_title: "The Forest and the Sea", creation_year: 1995, genre: "Folk")
Album.create(album_title: "The White Album", creation_year: 1995, genre: "Rap")
Album.create(album_title: "Nine Lives", creation_year: 1995, genre: "Alt Rock")
Album.create(album_title: "Ben Folds Live", creation_year: 1996, genre: "Piano")
Album.create(album_title: "By the Way, I Forgive You", creation_year: 1996, genre: "Country")
Album.create(album_title: "Parachutes", creation_year: 1997, genre: "Alt Rock")
Album.create(album_title: "Parachutes", creation_year: 1998, genre: "Suck Rock")
Album.create(album_title: "Chasing Twisters", creation_year: 1998, genre: "Soft Rock")


#Artist(name(s))
puts "seeding artists"
# 10.times do (
# Artist.create(name:Faker::Music.band))
# end
Artist.create(name: "The Beatles")
Artist.create(name: "The Kinks")
Artist.create(name: "The Struts")
Artist.create(name: "Oasis")
Artist.create(name: "Aerosmith")
Artist.create(name: "Freddy & Francine")
Artist.create(name: "Dry the River")
Artist.create(name: "Kanye")
Artist.create(name: "Brandi Carlisle")

#Song(title(s), artistid(i), albumid(i))
puts "seeding songs"

100.times do (
Song.create(song_title:Faker::Books::Lovecraft.deity, artist_id: Artist.all.sample.id, album_id: Album.all.sample.id)
)
end
puts "seeding complete"
