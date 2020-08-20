require_relative '../config/environment'
require_relative '../config/command_line_interface'
require 'tty-prompt'
prompt = TTY::Prompt.new
ActiveRecord::Base.logger = nil
# player = RubyAfplay::Player.new("./bin/parlor.mp3", volume: 2, time: 30, rate: 1)
# player.play
# player.pause
# player.stop

def clear!
    puts `clear`
end

puts "Welcome to TheSpin! What's your name?"
print "Enter your name: "
artist_name = gets.chomp

clear!

current_user = Artist.find_or_create_by(name: artist_name)

clear!

puts "You ready to get down, #{current_user.name}?"
main_menu
input = gets.chomp
clear!

while input != "Exit"
    case input
    when "1"
        prompt = prompt.select("\nHow would you like to search?", ["Artist", "Album", "Genre", "Release Year"])
        # puts "How would you like to search?"
        # puts "1. Artist"
        # puts "2. Album"
        # puts "3. Genre"
        # puts "4. Release year"
        # puts "5. Song Title"
        # print "Enter your selection: "
        # input = gets.chomp
        clear!
            
            if prompt == "Artist"
                puts "Enter Artist name: "
                artist_name = gets.chomp 
                found_artist = Artist.find_by(name: artist_name)
                found_artist.albums.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"} 
            
            elsif prompt == "Album"
                puts "Enter Album name: "
                album_title = gets.chomp
                xyz = Album.where(album_title: album_title)
                xyz.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
                
            
            elsif prompt == "Genre"
                puts "Enter genre name: "
                genre = gets.chomp
                found_album = Album.where(genre: genre)
                found_album.each {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
                # table = TTY::Table.new ['Artist','Album','Genre','Year'], [['a1', 'a2', 'a3', 'a4'], ['b1', 'b2']]
                # renderer = TTY::Table::Renderer::Basic.new(table)
                # table.render(:ascii)
                #tty table
                
                
            else prompt == "Release Year"
                puts "Enter release year(YYYY): "
                creation_year = gets.chomp
                a = Album.where(creation_year: creation_year)
                a.map {|date_instance| puts "#{date_instance.album_title} | #{date_instance.genre} | #{date_instance.creation_year}"}
            end 
        end 
            
    
            # when "5"
            #     puts "Enter song title: "
            #     song_title = gets.chomp
            #     found_song = Song.where(song_title: song_title)
            #     found_song.each {|song_instance| puts "#{song_instance.album_songs}|#{song_instance.genre}|#{song_instance.creation_year}"}
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
                    puts "Where to now? "
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
    
    
    
    
    
    
    