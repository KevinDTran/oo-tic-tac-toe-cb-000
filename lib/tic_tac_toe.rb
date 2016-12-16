class TicTacToe

  def initialize(board = nil)
    board = Array.new(9, " ")
    @board = board
    #@board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index (input)
    @index = input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @counts = []
    @board.each do |x|
      if x == "X" || x == "O"
        @counts << x
      else
        #pass
      end
    end
    return @counts.count
  end


  def current_player
    turns = turn_count
    if turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"

    index = input_to_index(gets.strip)

    while  valid_move?(index) == false
      puts "Invalid input, please enter 1-9"
      index = input_to_index(gets.strip)
    end
    move(index,current_player)
    display_board
  end


  def won?
    if @board.include?("X") == false && @board.include?("O") == false
      return false
    else
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
          return combo
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
    end
  end

  def full?
    (@board.include?(" ") || @board.include?("")) == false
  end

  def draw?
    if full? == true
      if won? == false
        return true
      elsif won? == false
        return false
      end
    else
      #pass
      puts "The game is not over"
    end
  end

  def over?
    if full? == true
      return true
    end
  end

  def winner
    if won? != false
      return @board[won?[0]]
    else
      #pass
    end
  end

end
