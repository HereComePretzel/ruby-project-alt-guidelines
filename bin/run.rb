require_relative '../config/environment'
ActiveRecord::Base.logger = nil

def clear
    puts "clear"
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
            gets.chomp
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
            print "Please enter Album Name: "
            album_title = gets.chomp
            print "Please enter Album Release Year: "
            creation_year = gets.chomp.to_i
            print "Please enter Album Genre: "
            genre = gets.chomp
            Album.create(
                album_title: album_title,
                creation_year: creation_year,
                genre: genre
            )
            puts "Thanks for adding your new album to this collection!"
        when "2"
            puts "Do you want to delete all albums?"
            puts "Yes/No" 
            print "Enter your selection: "
            input = gets.chomp
            if input == "Yes"
                Album.all.destroy_all
            else
                puts "Here is the list of albums to select from: "
            end  
            album_list = Album.all.map do |album_instance|
            puts "#{album_instance.id}. #{album_instance.album_title} | #{album_instance.creation_year}"
            end
            puts "Select the album you want to delete:"
            input = gets.chomp
            def delete_album(album_instance)
            x = album_list.find do |album|
                album.id == album_instance
            end
            y=x.id
            album_to_be_deleted = album_list.find_by(id: y)
            album_to_be_deleted.delete
            # Artist.albums = Artist.albums.filter do |key|
            #     key.album_title != album
            # end
            puts "Deleted"
            end
            when "3"


        

        #     puts "Album title: "
        #     input = gets.chomp
        #     puts "are you sure?"
        #     input = gets.chomp
        #     #removes album by album_name
        # when "3"
        #     puts "Album title: "
        #     input = gets.chomp
        #     #updates album info
            
        end 
    end


# binding.pry
