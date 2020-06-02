class Api
    #In this class I get all the character/quote details by calling API

    def self.get_character
        url = "https://breakingbadapi.com/api/characters"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |c|
            Character.new(c["char_id"], c["name"], c["birthday"], c["occupation"], c["nickname"], c["appearance"], c["portrayed"])

        end
    end

    def self.get_quotes
        url = "https://breakingbadapi.com/api/quotes"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |q|
            Quote.new(q["author"], q["quote"])
            #I only instantiated author and quote 
        end
    end
end

    
  
   

