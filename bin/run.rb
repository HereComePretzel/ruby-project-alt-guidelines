require_relative '../config/environment'
require_relative '../config/command_line_interface'
require 'tty-prompt'
prompt = TTY::Prompt.new
ActiveRecord::Base.logger = nil
player = RubyAfplay::Player.new("./bin/parlor.mp3", volume: 1, time: 300, rate: 1)
player.play
# player.pause
# player.stop


puts "Welcome to TheSpin! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

current_user = Artist.find_or_create_by(name: artist_name)

clear!

puts "You ready to get down, #{current_user.name}?"
main_menu
menu_items = prompt.select("What would you like to do next?", %w(Search Modify))
input = gets.chomp
clear!

while input != "Exit"
case input == "Search"
    when "1"
    #prompt.select("How would you like to search?", ["Artist", "Album", "Genre", "Release Year"])
    search
    select
    reply = gets.chomp
    clear!

        case reply       
            when "1"
                search_by_artist_name
                next_step
            when "2"
                search_by_album_name
                next_step
            when "3"
                search_by_genre
                next_step
            when "4"
                search_by_release_year
                next_step
        end
    when "2"
    options
    #prompt.select("Please select from the following options: ", ["Add Album", "Remove Album", "Update Album"])
    select
    answer = gets.chomp
    clear!
    
        case answer
            when "1"
                add_album
                #prompt.yes?("Would you like to add more albums?")
                puts "Would you like to add more albums?"
                puts "Yes/No"
                select
                answer = gets.chomp
                clear!
                if answer == "Yes"
                    add_album
                    exit_and_menu
                else
                    next_step
                end
                
            when "2"
                #prompt.yes?("Do you want to delete all albums?")
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
        
    when "3"
        puts "#{current_user.name}"
        puts "Number of albums: "
        puts "#{Album.all.count}"
        puts "Number of artists: "
        puts "#{Artist.all.count}"
        puts "Number of songs: "
        print "#{Song.all.count}"
        
    end 
    
end



