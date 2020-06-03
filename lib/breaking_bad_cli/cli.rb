class Cli
    #CLI starts
    def call
        system("clear") #clears terminal
        logo #This loads the ASCII Art data I created to welcome users.
        sleep(0.5)
        load_data #That's how I get the data for quotes and characters from API
        print_main_menu
    end

    def print_main_menu #Main Menu
        puts "To view all of the characters from the show, type 'list characters'".cyan
        puts "To view all of the quotes from the show, type 'list quotes'".cyan
        puts "To leave, type exit".cyan

        main_menu_selection
    end

    def main_menu_selection #User makes his choice from the main menu. 
        input = gets.chomp

        if input.downcase == "list characters"
            list_characters
            sub_menu #That's where we go one level deep
        elsif input.downcase == "list quotes"
            list_quotes
            print_continue
            continue?(prompt_selection)
        elsif input.downcase == "exit"
            exit_cli
        else
            print_error
            print_main_menu
        end
    end

    def sub_menu
        print_selection_prompt
        id = valid_id?(prompt_selection)#This method takes the input and checks if it's between 1 and Character.all.size
        character = Character.find_by_id(id)# This method locates that specific character in the array.
        print_details(character)
        print_continue
        continue?(prompt_selection)
        print_main_menu 
        main_menu_selection
    end
    
    def list_characters
        Character.all.each.with_index(1) {|c, i| puts "#{i}.) #{c.name}".light_magenta}
    end 

    def list_quotes
        Quote.all.each.with_index(1) {|q, i| puts "#{i}.) #{q.quote} - #{q.author}".light_red}
    end

    def logo
        puts"
        --  ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ████████╗ ██████╗ 
        --  ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔═══██╗
        --  ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗         ██║   ██║   ██║
        --  ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝         ██║   ██║   ██║
        --  ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗       ██║   ╚██████╔╝
        --   ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝       ╚═╝    ╚═════╝ 


        --  ██████╗ ██████╗ ███████╗ █████╗ ██╗  ██╗██╗███╗   ██╗ ██████╗     ██████╗  █████╗ ██████╗
        --  ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║ ██╔╝██║████╗  ██║██╔════╝     ██╔══██╗██╔══██╗██╔══██╗
        --  ██████╔╝██████╔╝█████╗  ███████║█████╔╝ ██║██╔██╗ ██║██║  ███╗    ██████╔╝███████║██║  ██║
        --  ██╔══██╗██╔══██╗██╔══╝  ██╔══██║██╔═██╗ ██║██║╚██╗██║██║   ██║    ██╔══██╗██╔══██║██║  ██║
        --  ██████╔╝██║  ██║███████╗██║  ██║██║  ██╗██║██║ ╚████║╚██████╔╝    ██████╔╝██║  ██║██████╔╝
        --  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚═╝  ╚═╝╚═════╝
        
        --   ██████╗██╗     ██╗
        --   ██╔════╝██║     ██║
        --   ██║     ██║     ██║
        --   ██║     ██║     ██║
        --   ╚██████╗███████╗██║
        --    ╚═════╝╚══════╝╚═╝ ".light_red
    end 

    def load_data 
        puts "Loading data now...".cyan
        sleep(1.5)
        character_loader = Api.get_character
        quotes_loadder = Api.get_quotes
        puts "Done!".cyan
        sleep(0.5)
    end

        
    def print_error
        puts "Invalid Selection, please try again".light_red
    end
    
      #Calls the instance methods in Character class and displays the information based on that character.
    def print_details(character)
        puts "Name:  #{character.name}".cyan
        puts "Birthday:  #{character.birthday}".cyan
        puts "Occupation:  #{character.occupation}".cyan
        puts "Nickname:  #{character.nickname}".cyan
        puts "Appearance:  #{character.appearance}".cyan
        puts "Portrayed:  #{character.portrayed}".cyan
    end
        

    def print_selection_prompt
        puts "please select a character by number for more information!".cyan
    end

    def print_continue
        puts "Would you like to continued? (y/n)".cyan
    end

    def exit_cli
        puts "Thanks for using our CLI!".cyan
        puts "Have a great day!!!!".cyan
        exit
    end

    #"gets" is a method that asks the user to input something.
    #"chomp" is a method that removes the blank line that is automatically created by "gets" after the input.
    def prompt_selection
        gets.chomp
    end 

    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Character.all.size
            print_error
            sleep(1) 
            main_menu_selectio
        end
        id
    end

    def continue?(choice)
        if choice == "y"
            system("clear")
            print_main_menu
            main_menu_selection
        else
            exit_cli
            exit
        end
    end

end
