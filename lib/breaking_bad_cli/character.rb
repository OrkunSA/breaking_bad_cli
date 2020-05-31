class Character
    attr_reader :name, :id
    attr_accessor :birthday, :occupation, :nickname, :appearance, :portrayed 
    @@all = []

    def initialize(name, id)
        @name = name
        @id = id 
        @quotes = 
        @@all << self
    end

    def quotes
        Quote.all.select do |quote|
            quote.character == self 
        end
    end





    def self.all
        @@all 
    end



    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end

    def update(birthday, occupation, nickname, appearance, portrayed)
        self.birthday = birthday 
        self.occupation = occupation
        self.nickname = nickname
        self.appearance = appearance
        self.portrayed = portrayed
    end


    




end