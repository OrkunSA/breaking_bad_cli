class Character
    attr_accessor :char_id, :name, :birthday, :occupation, :nickname, :appearance, :portrayed
    
    @@all = []

    def initialize(char_id, name, birthday, occupation, nickname, appearance, portrayed)
        @char_id = char_id
        @name = name
        @birthday = birthday
        @occupation = occupation
        @nickname = nickname
        @appearance = appearance
        @portrayed = portrayed
        @quotes = []
        @@all << self #save all attributes to class variable.
    end

    def self.all
        @@all
    end
    

    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end

    def quotes
        Quote.all.select {|quote| quote.author == self.name}
    end


end






