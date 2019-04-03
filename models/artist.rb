require_relative('../db/sql_runner.rb')


class Artist

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql,values)[0]["id"].to_i
  end

end
