require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #method that calls our variable that stores all instances
    @@all
  end

  def save #method that pushes self to our instance contianer
    self.class.all << self
  end

  def self.create #method that creates a new instance, pushes to @@all and then returns the new song instance
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name) #method that creates a new instance, assigns the name attribute, saves the instance and returns the song
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.create_by_name(song_name) #method that creates a new instance, assigns the name attribute, saves the instance and returns the song
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name) #method that encapsulates a find_by_name logic
  self.all.find do |song|
  song.name == song_name
  end
  end

  def self.find_or_create_by_name(song_name) #method that will either find by name if song_name == song, or will create a new one if it can't find it
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical #organizes songs by their name
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #method that parses a file name, creates a new instance of song, extracts the artist_name and song name, and then returns the song
    file = filename.split("-")
    # binding.pry
    song = Song.new
    song.artist_name = file[0].strip
    song.name = file[1].split(".")[0].strip
    song
  end

  def self.create_from_filename(filename) #method that takes new_from_filename and pushes it to our instance hodler.
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end
