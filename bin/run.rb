require_relative '../config/environment'
ActiveRecord::Base.logger = nil

def clear!
    puts 'clear'
end

puts "Hi Artist! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

current_user = Artist.find_or_create_by(name: artist_name)

puts "Welcome #{current_user.name}!"
puts "What would you like to do today?"
puts "1. Search collection"
puts "2. Modify collection"
puts "3. Browse collection"
puts "4. View profile"

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


when "2"
    puts "What would you like to change?"
    puts "1. Add Album"
    puts "2. Remove Album"
    puts "3. Update Album"
    modify = gets.chomp

when "3"
    puts "Show all albums"
    puts "1. Sort by Artist"
    puts "2. Sort by Album"
    puts "3. Sort by genre drop down li"

when "4"
    puts "See your user profile"
end


case modify
when "1"
    print "Please enter album title: "
    album_title = gets.chomp

    print "Please enter album creation year: "
    creation_year = gets.chomp.to_i

    print "Please enter album genre: "
    genre = gets.chomp

    Album.create(
        album_title: album_title,
        creation_year: creation_year,
        genre: genre
    )
    puts "Thanks for adding your new album to this collection!"
    puts "You can see the updated collection: "
    Album.all.map do |album_instance|
        puts "#{album_instance.id}. #{album_instance.album_title}"
    end

when "2"
    puts "Select the album you want to delete: "
    album_list = Album.all.map do |album_instance|
        puts "#{album_instance.id}. #{album_instance.album_title}"
    end
    album_to_be_deleted = Album.find_by(album_id: album_id)
    puts "Do you want to delete this album from your collection?"
    album_to_be_deleted.destroy

end

# binding.pry
