class Cli

    attr_accessor :name

    def call
        system("clear") 
        puts " -------------------------------------------------------------------- "
        puts "|                                                                    |"
        puts '|       Welcome to the best TV show of all time. Breaking Bad        |'
        puts '|                 "I am not in danger. I am the danger."             |'
        puts "|                                         - Walter White             |"
        puts " -------------------------------------------------------------------- "
        sleep(1.5)
        load_data
        main
    end

    def load_data 
        puts "Loading data now...".cyan
        data_loader = Api.get_character
        sleep(1.5)
        puts "Data loaded. Here we go!".cyan
    end

    def main
        print_all
        print_selection_prompt
        id = valid_id?(prompt_selection)
        updated_character = get_character_details(id)
        print_details(updated_character)
        print_continue
        continue?
    end
        

    def print_all
        Character.all.each.with_index(1) {|c, i| puts "#{i}.) #{c.name}".light_magenta}
    end 

    def print_error
        puts "Invalid Selection, please try again".cyan
    end

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
        puts "Have a great day".cyan
    end


    def prompt_selection
        gets.chomp
    end 

    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Character.all.size
            print_error
            sleep(1) 
            main
        end
        id
    end

    def continue?(choice)
        if choice == "y"
            main
        else
            exit_cli
        end
    end


    def get_character_details(id)
        Api.get_details_by_id(id)
    end

end