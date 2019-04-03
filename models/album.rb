require_relative('../db/sql_runner.rb')

class Album

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  















end
