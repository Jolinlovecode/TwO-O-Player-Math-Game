class Player
attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 0
  end
end

class Game

  attr_accessor :player1, :player2, :current_player

  def initialize (p_1, p_2)
  @player1 = p_1
  @player2 = p_2
  @player1.lives = 3
  @player2.lives = 3
  @current_player = @player1.name
  end

  def switch_player
      
    result = ((@current_player == @player1.name) ? @player2.name : @player1.name)
    @current_player = result
  end

  def game_over
  #     if (@player1.lives == 0 || @player2.lives == 0 ) {
  #         return true
  #     } else {
  # return false
  #     }
    @player1.lives == 0 || @player2.lives == 0 ? true : false
  end
  def questions
    while !game_over
      random_1 = rand(1..20)
      random_2 = rand(1..20)
    puts "#{@current_player} : What is #{random_1} plus #{random_2} ?"
      answer = gets.chomp.to_i
  if answer == random_1 + random_2
      puts "YES! You are correct!"
  else
      puts "Seriously? No!"
      @current_player == @player1.name ? @player1.lives -= 1 : @player2.lives -= 1 
  end
  puts  "Player1 #{@player1.lives}/3 vs Player2 #{@player2.lives}/3"
    switch_player
  end # end while
      puts "Game Over"
      winner = @player1.lives == 0 ? @player2.name : @player1.name
      score = @player1.lives == 0 ? @player2.lives : @player1.lives
      puts "#{winner} wins with a score of #{score}/3"
  end # questions

  
end

p_1 = Player.new('Willin')
p_2 = Player.new("Jolin")
match = Game.new(p_1, p_2)
match.questions

