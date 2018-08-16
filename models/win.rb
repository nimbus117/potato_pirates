class Win
  attr_accessor :date, :player_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @player_id = options['player_id'].to_i
  end

    def save()
      sql = "
        INSERT INTO wins
          (date, player_id)
        VALUES
          ($1, $2)
        RETURNING id
      "
      values = [@date, @player_id]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def update()
      sql = "
        UPDATE
          wins
        SET
          (date, player_id) = ($1, $2)
        WHERE
          id = $3
        "
      values = [@date, @player_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "
        DELETE FROM
          wins
        WHERE
          id = $1
        "
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def Win.map_items(win_data)
      win_data.map {|win| Win.new(win)}
    end

    def Win.all
      sql = "SELECT * FROM wins"
      wins = SqlRunner.run(sql)
      Win.map_items(wins)
    end

    def Win.delete_all
      sql = "DELETE FROM wins"
      SqlRunner.run(sql)
    end

    def Win.get_by_date(date)
      sql = "
      SELECT
        *
      FROM
        wins
      WHERE
        date = $1
      "
      values = [date]
      wins = SqlRunner.run(sql, values)
      Win.map_items(wins)
    end
end
