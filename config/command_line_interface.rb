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
        puts "Please select your next step: "
        exit_and_menu
    else
        clear!
        puts "Please select your next step: "
        exit_and_menu 
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
    puts "Please select your next step: "
    exit_and_menu
    else
        clear!
        puts "Please select your next step: "
        exit_and_menu 
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
    puts "Please select your next step: "
    exit_and_menu
end



