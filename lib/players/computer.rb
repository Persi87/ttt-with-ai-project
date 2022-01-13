module Players
    class Computer < Player

            def move(board)
                puts "Player #{token}, Please make a move!"
                move = nil
                if !board.taken?(5)
                    move = "5"
                else 
                    move = [1, 3, 7, 9, 2, 4, 6, 8].find {|num| !board.taken?(num)}.to_s
                end
                move
            end

    
    end
end
