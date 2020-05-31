class Api

    URL = "https://breakingbadapi.com/api/"


    def self.get_character
        response = RestClient.get(URL + "characters/?limit=50")
        data = JSON.parse(response.body)
        data.each do |character|
            id = character['char_id']
            name = character['name']
            Character.new(name, id)
        end
    end 

    
    def self.get_details_by_id(id)
        selected_character = Character.find_by_id(id)
        response = RestClient.get("#{URL}" + "characters/?limit=50" + "#{id}")
        data = JSON.parse(response.body)
        data = data[0]
        birthday = data["birthday"]
        occupation = data["occupation"].join(" , ")
        nickname = data["nickname"]
        appearance = data["appearance"].join(" , ")
        portrayed = data["portrayed"]
        selected_character.update(birthday, occupation, nickname, appearance, portrayed)
        selected_character
    end
    
    def self.get_quote
        res = RestClient.get(URL + "quotes/?limit=100")
        data = JSON.parse(res.body)
        data.each do |q|
            quote = q['quote']
            character =  q['author']
            Quote.new(quote, character)
        end
    end

end