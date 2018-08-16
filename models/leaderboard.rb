class Leaderboard

  def Leaderboard.get
    sql = "
      SELECT
        name, COUNT(wins.id) AS wins
      FROM
        wins
      INNER JOIN
        players
      ON
        player_id = players.id
      GROUP BY
        name
      ORDER BY
        wins DESC, name
    "
    SqlRunner.run(sql).map do |position|
      {
        name: position['name'],
        wins: position['wins'].to_i
      }
    end
  end

  def Leaderboard.show
    rows = []
    Leaderboard.get.each do |position|
      rows << [position[:name], position[:wins]]
    end
    table = Terminal::Table.new({
      :title => "Potato Pirates Leaderboard",
      :headings => ['Name', 'Wins'],
      :rows => rows
    })
    puts table
  end
end
