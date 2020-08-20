class Album < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs


    def album_list
        Album.all.map do |album_instance|
        puts "#{album_instance.id}. #{album_instance.album_title} | #{album_instance.creation_year}"
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
        puts "Thanks for adding your new album '#{album_title}' to this collection!"
    end

 
    def self.find_by_album_title(album_title)
        self.where(album_title: album_title)
    end

    def self.find_by_creation_year(creation_year)
        self.where(creation_year: creation_year)
    end

    def self.find_by_genre(genre)
        self.where(genre: genre)
    end

    def self.find_by_artist(artist)
        self.where(artist: artist)
            #album_instance.artist == self
            #does not work
         
    end 

    def delete_all_albums
        Album.all.destroy_all
        puts "All albums are being deleted"
    end

    def delete_album 
        puts "Here is the list of albums to select from: "
        album_list
        puts "Select the album id you want to delete:"
        x = gets.chomp.to_i
        album_to_delete = Album.all.find(x)
        puts "Are you sure that you want to delete #{x}?"
        puts "Yes/No"
        print "Enter your selection: "
        answer = gets.chomp
        clear!
        if answer == "Yes"
            album_to_delete.destroy 
        puts "Deleted!"
        puts "Enter 1 to go to main menu"
        main_menu = gets.chomp
        main_menu
        else
            clear!
        exit_and_menu 
        end
    end

    def update_album
        album_list
        puts "Please enter album id: "
        y = gets.chomp
        album_to_update = Album.all.find(y)
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
        puts "Your album is up-to-date!"
    end
end # of class 

