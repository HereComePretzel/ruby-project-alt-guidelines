require_relative '../config/environment'
require_relative '../config/command_line_interface'
require 'tty-prompt'
prompt = TTY::Prompt.new
ActiveRecord::Base.logger = nil
# player = RubyAfplay::Player.new("./bin/parlor.mp3", volume: 2, time: 30, rate: 1)
# player.play
# player.pause
# player.stop


puts "Welcome to TheSpin! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

current_user = Artist.find_or_create_by(name: artist_name)

clear!

puts "You ready to get down, #{current_user.name}?"
main_menu
input = gets.chomp
clear!

while input != "Exit"
case input
when "1"
    search
    select
    reply = gets.chomp
    clear!

        case reply        
            when "Artist"
                search_by_artist_name
                next_step
            when "Album"
                search_by_album_name
                next_step
            when "Genre"
                search_by_genre
                next_step
            when "Release Year"
                search_by_release_year
                next_step
            # when "5"
            #     puts "Enter song title: "
            #     song_title = gets.chomp
            #     found_song = Song.where(song_title: song_title)
            #     found_song.each {|song_instance| puts "#{song_instance.album_songs}|#{song_instance.genre}|#{song_instance.creation_year}"}
                # puts "Please select your next step: "
                # exit_and_menu
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
                    next_step
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
        
    when "3" 
        puts "#{current_user.name}"
        puts "Number of albums: "
        puts "#{Album.all.count}"
        puts "Number of artists: "
        puts "#{Artist.all.count}"
        puts "Number of songs: "
        puts "#{Song.all.count}"
    end
end



