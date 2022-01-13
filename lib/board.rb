class Board

    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{@cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        index = input.to_i - 1
        cells[index]
    end

    def full?
        cells.all? {|position| position == "X" || position == "O"}
    end

    def turn_count
        # count = []
        # cells.each do |position|
        #     if position == "X" || position == "O"
        #         count << position
        #     end
        # end
        # count.count
         cells.count {|position| position == "X" || position == "O"}
    end

    def taken?(input)   #position is not equal to " " or "" will return true
        !(position(input) == " " || position(input) == "")
    end

    def valid_move?(input)
        input.to_i.between?(1, 9) && !taken?(input)
    end

    def update(input, player) #player is Player instance
        cells[input.to_i - 1] = player.token
    end

end