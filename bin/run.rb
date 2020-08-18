require_relative '../config/environment'

def clear!
    puts 'clear'
end

puts "Hi Artist! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

current_user = Artist.find_or_create_by(name: artist_name)

puts "Welcome #{current_user.name}"
puts "What would you like to do next?"
puts "1. Search Collection"
puts "2. Modify Collection"
# puts "3. Browse Collection"
print "Enter your selection: "
input = gets.chomp
# clear!
    case input
    when "1"
        puts "How would you like to search?"
        puts "1. Artist"
        puts "2. Album"
        puts "3. Genre"
        puts "4. Release year"
        print "Enter your selection: "
        input = gets.chomp
            case input
            when "1"
                puts "Enter Artists' name: "
                gets.chomp 
                    Album.all.each do |artist_instance|
                        artist_instance.name
                    end
                #returns all album instances by artist
            when "2"
                puts "Enter Album name: "
                gets.chomp
                def find_by_album_title(album_title)
                    Album.all.select do |album_instance|
                        album_instance.album_title == self
                        binding.pry
                    end
                end
                #returns all album instances by album_name
            when "3"
                puts "Enter genre name: "
                gets.chomp
                #returns all album instances by genre
            when "4"
                puts "Enter release year(YYYY): "
                gets.chomp
                #returns all album instances by release year
            end 

    when "2"
        puts "1. Add Album"
        puts "2. Remove Album"
        puts "3. Update Album"
        print "Enter your selection: "
        input = gets.chomp
            case input
            when "1"
                puts "Album Name: "
                input = gets.chomp
                puts "Artist Name: "
                input = gets.chomp
                puts "Genre: "
                input = gets.chomp
                puts "Release year: "
                input = gets.chomp
                #adds album to collection
            when "2"
                puts "Album title: "
                input = gets.chomp
                puts "are you sure?"
                input = gets.chomp
                #removes album by album_name
            when "3"
                puts "Album title: "
                input = gets.chomp
                #updates album info
            end 
    # when "3"
    #     puts "1. Browse by Artist"
    #     puts "2. Browse by Album"
    #     puts "3. Browse by genre"
    #     puts "4. Browse by release year"
    #     print "Enter your selection: "
    #     input = gets.chomp
    #         case input
    #         when "1"
    #             puts "Enter artists' name: "
    #             gets.chomp
    #             #3
    #         when "2"
    #             puts "Enter genre: "
    #             gets.chomp
    #             #returns all album with genre
    #         when "3"
    #             puts "Enter release year: "
    #             gets.chomp
    #             #returns all albums with release year
    #         end 
    
end 

    #         case input
    #         when "1"
    #         puts "Enter artist name: "
    #         gets.chomp
    #         #find album by artist name
    #     when "2"
    #         puts "Enter album name: "
    #         gets.chomp
    #         #returns albums by album name
    #     when "3"
    #         puts "Enter genre: "
    #         gets.chomp
    #         #returns albums by genre
    #     when "4"
    #         puts "Enter release year(YYYY): "
    #         gets.chomp
    #         #returns albums by release year
    #     end 
    # case input_modify
    # when "2"

# puts "1. View your profile"
# puts "2. View your songs"
# puts "3. Create a song"
# puts "4. Remove a song"

# print "Enter your selection: "
# input = gets.chomp

# # clear!

# case input
# when "1"
#     puts "Profile page"
# when "2"
#     puts "Here are all your songs: "
#     current_user.songs.each do |song|
#         puts "#{song.album.album_title} | #{song.song_title}"
#     end
# when "3"
#     puts "Add your song"
#     puts "Please see the list of available albums: "
#     Album.all.each do |album|
#         puts "#{album.id}. #{album.album_title}"
#     end

#     print "Please enter your album id: "
#     album_id = gets.chomp.to_i

#     print "Please enter song title: "
#     song_title = gets.chomp

#     Song.create(
#         song_title: song_title,
#         artist_id: current_user.id,
#         album_id: album_id
#     )

# when "4"
#     puts "Remove your song"
# end

# #binding.pry
