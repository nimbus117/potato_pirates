require('pry-byebug')
require('terminal-table')
require_relative('models/player.rb')
require_relative('models/win.rb')
require_relative('models/leaderboard.rb')
require_relative('db/sql_runner.rb')

# remove Leaderboard class and move Leaderboard.get to wins class as class method 'Wins.Leaderboard'
# move terminal-table function to console.rb, use for all 'view' options
# add Wins.all_with_name (join) and order by date desc
# order Player.all by name
# add player.wins method


while true do
  system 'clear'
  puts "\n1. View leaderboard "\
    "\n2. View players"\
    "\n3. Add player"\
    "\n4. View wins"\
    "\n5. Add win"\
    "\n6. Exit"
  print "\nEnter option: "
  input = gets.chomp.to_i

  case input
  when 1
    system 'clear'
    puts ''
    Leaderboard.show
    print "\nPress enter to continue"
    gets
  when 3
    system 'clear'
    print "\nEnter player name ('Bob'): "
    name = gets.chomp
    print "Enter player cohort ('E24'): "
    cohort = gets.chomp
  when 5
    system 'clear'
    print "\nEnter player name ('Bob'): "
    name = gets.chomp
    print "Enter win date ('2018-08-16'): "
    cohort = gets.chomp
  when 6
    system 'clear'
    break
  when 10
    binding.pry
  end
end

# Player.delete_all
# Win.delete_all

# player1 = Player.new({
#   'name' => 'James',
#   'cohort' => 'E24'
# })
# player1.save

# player2 = Player.new({
#   'name' => 'Laura',
#   'cohort' => 'E24'
# })
# player2.save

# player3 = Player.new({
#   'name' => 'Alison',
#   'cohort' => 'E24'
# })
# player3.save

# player4 = Player.new({
#   'name' => 'Cristian',
#   'cohort' => 'E24'
# })
# player4.save

# win1 = Win.new({
#   'date' => '2018-08-09',
#   'player_id' => player4.id
# })
# win1.save

# win2 = Win.new({
#   'date' => '2018-08-09',
#   'player_id' => player4.id
# })
# win2.save

# win3 = Win.new({
#   'date' => '2018-08-09',
#   'player_id' => player1.id
# })
# win3.save

# win4 = Win.new({
#   'date' => '2018-08-16',
#   'player_id' => player3.id
# })
# win4.save

# win5 = Win.new({
#   'date' => '2018-08-16',
#   'player_id' => player2.id
# })
# win5.save

# binding.pry
# nil
