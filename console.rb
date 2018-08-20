require('pry-byebug')
require('terminal-table')
require_relative('models/player.rb')
require_relative('models/win.rb')
require_relative('models/leaderboard.rb')
require_relative('db/sql_runner.rb')

# not sure what to do with leaderboard. Should it even be a class?

while true do
  system 'clear'
  puts "\n1. View leaderboard "\
    "\n2. View players"\
    "\n3. Add player"\
    "\n4. Add win"\
    "\n5. Exit"
  print "\nEnter option: "
  input = gets.chomp.to_i

  case input
  when 1
    system 'clear'
    puts ''
    Leaderboard.show
    print "\nPress enter to continue"
    gets
  when 2
    system 'clear'
    puts ''
    Player.all.sort_by {|player| player.name}.each {|player| puts player.name}
    print "\nPress enter to continue"
    gets
  when 3
    system 'clear'
    print "\nEnter player name ('Bob'): "
    name = gets.chomp
    print "Enter player cohort ('E24'): "
    cohort = gets.chomp
    new_player = Player.new({
      'name' => name,
      'cohort' => cohort
    })
    new_player.save
  when 4
    system 'clear'
    print "\nEnter player name ('Bob'): "
    name = gets.chomp
    print "Enter win date ('2018-08-16'): "
    date = gets.chomp
    player = Player.get_by_name(name)
    new_win = Win.new({
      'date' => date,
      'player_id' => player.id
    })
    new_win.save
  when 5
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
