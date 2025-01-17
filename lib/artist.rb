class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !(@songs.include?(song))
      @songs << song
    end
  end
  
  def genres
    genre_array = @songs.collect do |song|
      song.genre
    end
    genre_array.uniq
  end
  
end