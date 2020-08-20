require_relative '../config/environment'
require_relative '../config/command_line_interface'
ActiveRecord::Base.logger = nil

puts "Welcome to APP NAME! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

current_user = Artist.find_or_create_by(name: artist_name)


clear!
puts "Hey there, #{current_user.name}!"
main_menu
input = gets.chomp
clear!

while input != "Exit"
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
                artist_name = gets.chomp 
                #returns all album instances by artist
            when "2"
                puts "Enter Album name: "
                #returns all album instances by album_name
            when "3"
                puts "Enter genre name: "
                genre = gets.chomp
                #returns all album instances by genre
            when "4"
                puts "Enter release year(YYYY): "
                creation = gets.chomp
                self.creation_year == creation
                puts "#{album_title} | #{creation_year} | #{genre}"
                
                #returns all album instances by release year
            end 

    

when "2"
    options
    select
    answer = gets.chomp
    clear!

        case answer
            when "1"
                add_album
                puts "Would you like to add more albums?"
                puts "Yes/No"
                select
                answer = gets.chomp
                clear!
                if answer == "Yes"
                    add_album
                    exit_and_menu
                else
                    puts "Please select your next step: "
                    exit_and_menu
                end
    
            when "2"
                puts "Do you want to delete all albums?"
                puts "Yes/No" 
                select
                delete_input = gets.chomp
                clear!
                if delete_input == "Yes"
                    delete_all_albums
                else
                    delete_album 
                end  

            when "3"
                update_album
        end
    end
end



 


