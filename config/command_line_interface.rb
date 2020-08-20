# require 'tty-prompt'
# prompt = TTY::Prompt.new

def clear!
    puts `clear`
end

def main_menu
    puts <<~MainMenu
    What would you like to do next?
    1. Search collection
    2. Modify collection
    3. View profile
    Enter your selection: 
    MainMenu
end

def options
    puts <<~Options
    Please select from the following options:
    1. Add Album
    2. Remove Album
    3. Update Album
    Options
end

def select
    print "Enter your selection: "
end

def next_step
    puts "\nPlease select your next step: "
    exit_and_menu
end

def exit_and_menu
    puts "1. Main Menu"
    puts "2. Exit"
    print "Enter your selection: "
    input = gets.chomp
    case
    when input == "1"
        clear!
        main_menu
        input = gets.chomp
        clear!
    when input == "2"
        clear!
        puts "Hope to see you again!"
        exit
    end
end

def search
    prompt.select("How would you like to search?", ["Artist case_artist", "Album", "Genre", "Release Year"])
    # puts "How would you like to search?"
    # puts "1. Artist"
    # puts "2. Album"
    # puts "3. Genre"
    # puts "4. Release year"
    # puts "5. Song Title"
end

def search_by_album_name
    puts "Enter Album name: "
    album_title = gets.chomp
    xyz = Album.where(album_title: album_title)
    xyz.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
end

def search_by_artist_name
    puts "Enter Artist name: "
    artist_name = gets.chomp 
    found_artist = Artist.find_by(name: artist_name)
    found_artist.albums.map {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
end

def search_by_genre
    puts "Enter genre name: "
    genre = gets.chomp
    found_album = Album.where(genre: genre)
    found_album.each {|album_instance| puts "#{album_instance.album_title} | #{album_instance.genre} | #{album_instance.creation_year}"}
end

def search_by_release_year
    puts "Enter release year(YYYY): "
    creation_year = gets.chomp
    a = Album.where(creation_year: creation_year)
    a.map {|date_instance| puts "#{date_instance.album_title} | #{date_instance.genre} | #{date_instance.creation_year}"}
end

def album_list
    Album.all.map do |album_instance|
    puts "#{album_instance.id}. #{album_instance.album_title} | #{album_instance.creation_year} | #{album_instance.genre}"
    end
end

def add_album
    puts "You'll have to enter your album title, release year and genre"
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
    clear!
    puts "Thanks for adding your new album '#{album_title}' to this collection!"

end

def delete_all_albums
    puts "Are you sure that you want to delete all albums?"
    puts "Yes/No"
    print "Enter your selection: "
    answer = gets.chomp
    clear!
    if answer == "Yes"
        Album.all.destroy_all
        puts "All albums are deleted!!!"
        next_step
    else
        clear!
        next_step
    end
end

def delete_album 
    puts "Here is the list of albums to select from: "
    album_list
    puts "Select the album id you want to delete:"
    x = gets.chomp.to_i
    album_to_delete = Album.all.find(x)
    clear!
    puts "Are you sure that you want to delete the album '#{album_to_delete.album_title}'?"
    puts "Yes/No"
    print "Enter your selection: "
    answer = gets.chomp
    clear!
    if answer == "Yes"
        album_to_delete.destroy 
        clear!
        puts "'#{album_to_delete.album_title}' Deleted!"
        next_step
    else
        clear!
        next_step 
    end
end

def update_album
    album_list
    puts "Please enter album id: "
    y = gets.chomp
    album_to_update = Album.all.find(y)
    clear!
    puts "#{album_to_update.id}. #{album_to_update.album_title} | #{album_to_update.creation_year} | #{album_to_update.genre}"
    puts "You can now update album '#{album_to_update.album_title}'"
    print "Please enter Album Name: "
    album_title = gets.chomp
    print "Please enter Album Release Year: "
    creation_year = gets.chomp.to_i
    print "Please enter Album Genre: "
    genre = gets.chomp
    album_to_update.update(
    album_title: album_title,
    creation_year: creation_year,
    genre: genre
    )
    clear!
    puts "Your albums are up-to-date!"
    next_step
end





