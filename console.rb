require('pry-byebug')
require_relative('models/player.rb')
require_relative('models/win.rb')
require_relative('models/leaderboard.rb')
require_relative('db/sql_runner.rb')

Player.delete_all

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

binding.pry
nil
