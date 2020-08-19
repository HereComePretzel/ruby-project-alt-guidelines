require_relative '../config/environment'
ActiveRecord::Base.logger = nil

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
                #returns all album instances by artist
            when "2"
                puts "Enter Album name: "
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
    
    
end 

