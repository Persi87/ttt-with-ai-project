module Players
    class Human < Player

            def move(board)
                puts "Player #{token}, Please make a move!"
                input = gets.strip
            end

    end

end