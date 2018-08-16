require('pry-byebug')
require('terminal-table')
require_relative('models/player.rb')
require_relative('models/win.rb')
require_relative('models/leaderboard.rb')
require_relative('db/sql_runner.rb')

Player.delete_all
Win.delete_all

player1 = Player.new({
  'name' => 'James',
  'cohort' => 'E24'
})
player1.save

player2 = Player.new({
  'name' => 'Laura',
  'cohort' => 'E24'
})
player2.save

player3 = Player.new({
  'name' => 'Alison',
  'cohort' => 'E24'
})
player3.save

player4 = Player.new({
  'name' => 'Cristian',
  'cohort' => 'E24'
})
player4.save

win1 = Win.new({
  'date' => '2018-08-09',
  'player_id' => player4.id
})
win1.save

win2 = Win.new({
  'date' => '2018-08-09',
  'player_id' => player4.id
})
win2.save

win3 = Win.new({
  'date' => '2018-08-09',
  'player_id' => player1.id
})
win3.save

win4 = Win.new({
  'date' => '2018-08-16',
  'player_id' => player3.id
})
win4.save

win5 = Win.new({
  'date' => '2018-08-16',
  'player_id' => player2.id
})
win5.save

binding.pry
nil
