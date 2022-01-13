class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3 ,6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
      ]

      def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
      end

      def current_player                # if @board (new board instance) is divisible by 2, player 1's turn, else player 2's
        @board.turn_count % 2==0 ? @player_1 : @player_2
      end

      def won?
         WIN_COMBINATIONS.find do |combos|
            @board.cells[combos[0]] == @board.cells[combos[1]] && 
            @board.cells[combos[1]] == @board.cells[combos[2]] && 
            @board.taken?(combos[0] + 1)          # check what the + 1 is for
         end
      end

      def draw?
        @board.full? && !won?
      end

      def over?
        draw? || won?
      end

      def winner
        if win = won?
          @winner = board.cells[win.first]
        end
      end

      def turn
        players_move = current_player.move(@board) # store the return of move (an integer) and use that to update the board with the current players token...
          if !@board.valid_move?(players_move)
            turn
          else
            @board.update(players_move, current_player)  #...here
            @board.display
          end
      end

      def play
        until over?
          turn
        end
        if won? 
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end      

      def start
        player_amount = nil

          puts "Welcome to Tic Tac Toe"
          puts "\n\n"
          puts "How many players would like to play... 0 , 1 or 2?"
          puts "\n\n"
              until player_amount.between?(0, 2) do
          player_amount = gets.chomp
                  puts "You can only have a maximum of 2 players... Please choose between 0, 1 or 2 players!"
              end
      end
end