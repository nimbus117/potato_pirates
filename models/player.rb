class Player
  attr_accessor :name, :cohort
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @cohort = options['cohort']
  end

    def save()
      sql = "
        INSERT INTO players
          (name, cohort)
        VALUES
          ($1, $2)
        RETURNING id
      "
      values = [@name, @cohort]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def update()
      sql = "
        UPDATE
          players
        SET
          (name, cohort) = ($1, $2)
        WHERE
          id = $3
        "
      values = [@name, @cohort, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "
        DELETE FROM
          players
        WHERE
          id = $1
        "
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def Player.map_items(player_data)
      player_data.map {|player| Player.new(player)}
    end

    def Player.all
      sql = "SELECT * FROM players"
      players = SqlRunner.run(sql)
      Player.map_items(players)
    end

    def Player.delete_all
      sql = "DELETE FROM players"
      SqlRunner.run(sql)
    end

    def Player.get_by_name(name)
      sql = "
      SELECT
        *
      FROM
        players
      WHERE
        name = $1
      "
      values = [name]
      player = SqlRunner.run(sql, values).first
      Player.new(player)
    end
end
