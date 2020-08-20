require_relative '../config/environment'
# player = RubyAfplay::Player.new("./bin/parlor.mp3", volume: 2, time: 30, rate: 1)
# player.play
# player.pause
# player.stop

def clear!
    puts `clear`
end

puts "Hi Artist! What's your name?"
print "Enter your name: "
artist_name = gets.chomp
clear!



current_user = Artist.find_or_create_by(name: artist_name)

puts "Welcome #{current_user.name}"
puts "What would you like to do next?"
puts "1. Search Collection"
puts "2. Modify Collection"
puts "3. View Profile"
print "Enter your selection: "
input = gets.chomp
 clear!
    case input
    when "1"
        puts "How would you like to search?"
        puts "1. Artist"
        puts "2. Album"
        puts "3. Genre"
        puts "4. Release year"
        puts "5. Song Title"
        print "Enter your selection: "
        input = gets.chomp
        clear!
            case input
            when "1"
                puts "Enter Artists' name: "
                artist_name = gets.chomp 
                found_artist = Artist.find_by(name: artist_name)
                found_artist.albums.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"} 
            
            when "2"
                puts "Enter Album name: "
                album_title = gets.chomp
                xyz = Album.where(album_title: album_title)
                xyz.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
                
            
            when "3"
                puts "Enter genre name: "
                genre = gets.chomp
                found_album = Album.where(genre: genre)
                found_album.each {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
                # table = TTY::Table.new ['Artist','Album','Genre','Year'], [['a1', 'a2', 'a3', 'a4'], ['b1', 'b2']]
                # renderer = TTY::Table::Renderer::Basic.new(table)
                # table.render(:ascii)
                #tty table
                
                
            when "4"
                puts "Enter release year(YYYY): "
                creation_year = gets.chomp
                a = Album.where(creation_year: creation_year)
                a.map {|date_instance| puts "#{date_instance.album_title} | #{date_instance.genre} | #{date_instance.creation_year}"}
            
    
            # when "5"
            #     puts "Enter song title: "
            #     song_title = gets.chomp
            #     found_song = Song.where(song_title: song_title)
            #     found_song.each {|song_instance| puts "#{song_instance.album_songs}|#{song_instance.genre}|#{song_instance.creation_year}"}
    
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

