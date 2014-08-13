class Player

  def initialize position, facing_index
    @position = position
    @facing_index = facing_index
  end

  def move_forward
    case facing
    when :north
    when :east
    when :south
    when :west
    end
  end

  def turn_left
    set_facing(@facing_index - 1)
  end

  def turn_right
    set_facing(@facing_index + 1)
  end

  def grab
  end

  def shoot
  end

  def climb
  end

  def set_facing
    if @facing_index < 0
      @facing_index += 4
    else
      @facing_index = (@facing_index + 1) % 4
    end
  end

  def facing
    facing = [:north, :east, :south, :west]
    facing[@facing_index]
  end

end

class SquareMaze
  def initialize(width, height)
    @maze = []
    height.times do |i|
      @maze[i] = []
      width.times do |j|
        @maze[i][j] = Room.new
      end
    end
  end

  def to_s
    @maze.to_s
  end
end

class Room
  attr_accessor :contents

  def initialize contents=nil
    @contents = contents
  end
end
