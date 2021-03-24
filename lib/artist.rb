
class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def add_song(name)
        name.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.find {|artist| artist.name == name}
            return self.all.find {|artist| artist.name == name}
        else
            name = self.new(name)
        end
    end 
    
    def print_songs
        array = Song.all.select {|song| song.artist == self}
        array.each {|name| puts name.name}
    end
end