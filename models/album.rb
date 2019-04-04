require_relative('../db/sql_runner.rb')
require_relative('artist.rb')
class Album

attr_reader :id, :title, :genre, :artist_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@title,@genre,@artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map {|album|Album.new (album)}
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql,values)[0]
    results = Artist.new(results)
  end

end
