require_relative '../config/environment'
$prompt = TTY::Prompt.new
$font = TTY::Font.new(:doom)
$pastel = Pastel.new

def app_intro
    puts $pastel.white($font.write("The Spin"))
    login_page
end

def login_page
    input = $prompt.select("TheSpin Welcomes You!", ["Login", "Sign Up"])
    case
    when input == "Login"
        puts "What's Your Name?"
        print "Enter Your Name: "
        artist_name = gets.chomp
        current_user = Artist.find_by(name: artist_name)
        clear!
        sleep 0.5
        if current_user
            puts "You ready to get down, #{current_user.name}!"
            puts ""
            main_menu
        else
            puts "Sorry! Seems we don't have you in our database. Please sign up!"
            puts ""
            login_page
        end
    when input == "Sign Up"
        puts "What's Your Name?"
        print "Enter Your Name: "
        artist_name = gets.chomp
        current_user = Artist.create(name: artist_name)
        clear!
        sleep 0.5
        puts "Nice to see You, #{current_user.name}!"
        puts ""
        main_menu
    end
end

def main_menu
    input = $prompt.select("What would you like to do next?", ["Search Collection", "Modify Collection", "Log Out"])
    clear!
    sleep 0.5
    case 
    when input == "Search Collection"
        selection
    when input == "Modify Collection"
        modify
    when input == "Log Out"
        input = $prompt.select("Are you logging off?", ["Yes", "No"])
        if input == "Yes"
            clear!
            sleep 0.25
            puts $pastel.white($font.write("Hope to see you again!"))
            puts ""
            exit
        else
            sleep 0.5
            clear!
            main_menu
        end
    end
end

def selection 
    input = $prompt.select("How would you like to search?", ["Artist", "Album", "Genre", "Release Year", "Song Title", "Back to Main Menu"])
    clear!
    sleep 0.5
    case        
    when input == "Artist"
        search_by_artist_name
        exit_and_menu
    when input == "Album"
        search_by_album_name
        exit_and_menu
    when input == "Genre"
        search_by_genre
        exit_and_menu
    when input == "Release Year"
        search_by_release_year
        exit_and_menu
    when input == "Song Title"
        search_by_song_title 
        exit_and_menu
    when input == "Back to Main Menu"
        main_menu
    end
end

def modify
    input = $prompt.select("Please select from the following options:", ["Add Album", "Remove Album", "Update Album", "Back to Main Menu"])
    clear!
    case
    when input == "Add Album"
        sleep 0.25
        add_album
        input = $prompt.select("Would you like to add more albums?", ["Yes", "No"])
        clear!
        sleep 0.25
        if input == "Yes"
            add_album
            exit_and_menu
        else
            exit_and_menu
        end
    when input == "Remove Album"
        input = $prompt.select("Do you want to delete all albums?", ["Yes", "No"])
        clear!
        sleep 0.25
        if input == "Yes"
            delete_all_albums
        else
            delete_album 
        end  
    when input == "Update Album"
        update_album
    when input == "Back to Main Menu"
        main_menu
    end
end

def clear!
    puts `clear`
end

def exit_and_menu
    input = $prompt.select("Please select your next step: ", ["Menu", "Log Out"])
    case
    when input == "Menu"
        clear!
        main_menu
        clear!
    when input == "Log Out"
        clear!
        input = $prompt.select("Are you logging off?", ["Yes", "No"])
        if input == "Yes"
            clear!
            sleep 0.25
            puts $pastel.white($font.write("Hope to see you again!"))
            puts ""
            exit
        else
            sleep 0.5
            clear!
            main_menu
        end
    end
end

def search_by_artist_name
    puts "Enter Artist name: "
    artist_name = gets.chomp 
    clear!
    sleep 0.25
    found_artist = Artist.find_by(name: artist_name)
    if found_artist 
        puts "List of albums for '#{artist_name}': "
        puts ""
        found_artist.albums.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
        puts ""
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end

def search_by_album_name
    puts "Enter Album name: "
    album_title = gets.chomp
    clear!
    sleep 0.25
    album_instance = Album.find_by(album_title: album_title)
    if album_instance 
        puts "List of albums for '#{album_title}': "
        puts ""
        xyz = Album.where(album_title: album_title)
        xyz.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
        puts ""
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end

def search_by_song_title
    puts "Enter Song title: "
    song_title = gets.chomp
    clear!
    sleep 0.25
    found_song = Song.find_by(song_title: song_title)
    if found_song
        puts "List of albums for '#{song_title}'"
        puts ""
        found_song = Song.where(song_title: song_title)
        x = found_song.map {|song_instance|song_instance.album_id}
        song_albums = Album.where(id: x)
        song_albums.map {|album_instance|puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
        puts ""
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end

def search_by_genre
    puts "Enter genre name: "
    genre = gets.chomp
    clear!
    sleep 0.25
    found_genre = Album.find_by(genre: genre)
    if found_genre
        puts "List of albums for '#{genre}': "
        puts ""
        found_album = Album.where(genre: genre)
        found_album.each {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
        puts ""
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end

def search_by_release_year
    puts "Enter release year(YYYY): "
    creation_year = gets.chomp
    clear!
    sleep 0.25
    found_by_creation_year = Album.find_by(creation_year: creation_year)
    if found_by_creation_year
        puts "List of albums released in #{creation_year}"
        puts ""
        a = Album.where(creation_year: creation_year)
        a.map {|date_instance| puts "#{date_instance.album_title} | #{date_instance.genre} | #{date_instance.creation_year}"}
        puts ""
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end

def album_list
    Album.all.map do |album_instance|
    puts "#{album_instance.id}. #{album_instance.album_title} | #{album_instance.creation_year} | #{album_instance.genre}"
    end
end

def add_album
    puts "You'll have to enter your album title, release year and genre!"
    puts ""
    print "Please enter your Album Name: "
    album_title = gets.chomp
    puts ""
    print "Please enter Album Release Year: "
    creation_year = gets.chomp.to_i
    puts ""
    print "Please enter Album Genre: "
    genre = gets.chomp
    puts ""
    Album.create(
    album_title: album_title,
    creation_year: creation_year,
    genre: genre
    )
    clear!
    puts "Adding new album to your collection..."
    sleep 1
    clear!
    puts "Thanks for adding your new album '#{album_title}' to this collection!"
    puts ""
end

def delete_all_albums
    input = $prompt.select("Are you sure that you want to delete all albums?", ["Yes", "No"])
    clear!
    sleep 0.5
    if input == "Yes"
        puts "Removing all albums..."
        sleep 1
        clear!
        Album.all.destroy_all
        puts "All albums are deleted!!!"
        puts ""
        exit_and_menu
    else
        clear!
        exit_and_menu
    end
end

def delete_album 
    puts "Here is the list of albums to select from: "
    puts ""
    album_list
    puts ""
    puts "Select the album id you want to delete:"
    x = gets.chomp.to_i
    album_found = Album.find_by(id: x)
    if album_found
        album_to_delete = Album.all.find(x)
        clear!
        input = $prompt.select("Are you sure that you want to delete the album '#{album_to_delete.album_title}'?", ["Yes", "No"])
        clear!
        sleep 0.25
    if input == "Yes"
        album_to_delete.destroy 
        clear!
        puts "Removing..."
        sleep 2
        clear!
        puts "'#{album_to_delete.album_title}' Deleted!"
        puts ""
        exit_and_menu
    else
        clear!
        exit_and_menu
    end
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end

def update_album
    album_list
    puts "Please enter album id: "
    y = gets.chomp
    album_found = Album.find_by(id: y)
    if album_found
        album_to_update = Album.all.find(y)
        clear!
        puts "#{album_to_update.id}. #{album_to_update.album_title} | #{album_to_update.creation_year} | #{album_to_update.genre}"
        puts ""
        puts "You can now update album '#{album_to_update.album_title}'"
        puts ""
        print "Please enter Album Name: "
        album_title = gets.chomp
        puts ""
        print "Please enter Album Release Year: "
        creation_year = gets.chomp.to_i
        puts ""
        print "Please enter Album Genre: "
        genre = gets.chomp
        album_to_update.update(
        album_title: album_title,
        creation_year: creation_year,
        genre: genre
        )
        clear!
        puts "Updating the album '#{album_to_update.album_title}..."
        sleep 1
        clear!
        puts "Your albums are up-to-date!"
        puts ""
        exit_and_menu
    else
        clear!
        puts "No result found. Redirecting to Main Menu..."
        sleep 2
        clear!
        main_menu
    end
end