class Quote
    attr_accessor :author, :quote, :character

    @@all = []

    def initialize(author, quote)
        @author = author
        @quote = quote
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end
  
end
