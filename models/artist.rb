require_relative('../db/sql_runner.rb')
require_relative('album.rb')


class Artist

attr_reader :id, :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql,values)[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map {|artist|Artist.new(artist)}
  end

  def albums
    sql = 'SELECT * FROM albums WHERE id = $1'
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map {|album| Album.new (album)}
  end


end
