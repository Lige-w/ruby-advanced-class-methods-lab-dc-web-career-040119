require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = '', artist_name = '')
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new.save
    all.last
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    Song.new_by_name(name).save
    all.last
  end

  def self.find_by_name(name)
    Song.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name).nil? ? Song.create_by_name(name) : Song.find_by_name(name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    filename.slice!('.mp3')
    file = filename.split(' - ')
    Song.new(file[1], file[0])
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

  def self.destroy_all
    all.clear
  end
end

puts Song.create_by_name('foo')
puts '~~~~~~'
puts Song.find_by_name('bar').nil?
#
#
#
# puts Song.all
