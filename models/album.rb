require_relative('../db/sql_runner.rb')



class Album

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


end
