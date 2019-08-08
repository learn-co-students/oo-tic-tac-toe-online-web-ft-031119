class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]
  ]

  def initialize
    @board = 9.times.collect{|n| " "}
  end

  def display_board
    puts "-----------"
    puts " "+@board[0,3].join(" | ")+" "
    puts " "+@board[3,3].join(" | ")+" "
    puts " "+@board[6,3].join(" | ")+" "
    puts "-----------"
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index,token)
    @board[index] = token
  end

  def position_taken?(index)
    return !(@board[index] == " ")
  end

  def valid_move?(index)
    return index >= 0 && index <= 8 && !position_taken?(index)
  end

  def turn_count
    return @board.count{|n| n == "X" || n == "O"}
  end

  def current_player
    return turn_count%2 == 0 ? "X" : "O"
  end

  def turn
    index = input_to_index(gets.chomp)
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
        return combo
      end
    end
    return false
  end

  def full?
    if !won?
      return @board.count{|n| n == "X" || n == "O"} == 9
    end
    return won?
  end

  def draw?
    return !won? && full?
  end

  def over?
    return draw? || won?
  end

  def winner
    if won?
      return @board[(won?[0])]
    end
    return nil
  end

  def play
    while !over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    end
    puts "Cat's Game!"
  end

end
