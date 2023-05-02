class Player
  def initialize(id)
    @id = id
    @score = 3
  end
  
  def win
    puts "Correct!"
  end

  def lose
    @score -= 1 
    puts "Wrong!"
  end

  attr_accessor :score, :id
end

def round(player)
  num_one = rand(1..100)
  num_two = rand(1..100)
  solution = num_one + num_two

  puts "----- NEW TURN -----"
  puts "PLAYER #{player.id}: What is #{num_one} plus #{num_two} ?"
  gets.chomp == solution.to_s ? player.win : player.lose
end

def game 
  player_one = Player.new(1)
  player_two = Player.new(2)
  player_one_turn = true
  current_player = player_one

  until player_one.score == 0 || player_two.score == 0

    round(current_player)
    puts "PLAYER ONE: #{player_one.score}/3 , PLAYER TWO: #{player_two.score}/3"

    player_one_turn = player_one_turn ? false : true
    current_player = player_one_turn ? player_one : player_two
  end
  

  puts "Player #{current_player.id} wins with a score of #{current_player.score}/3!"
  puts "----- GAME OVER -----"
  puts "Good bye!"
end

puts game
