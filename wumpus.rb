class Player
  attr_reader :xposition, :yposition, :facing_index

  def initialize maze, x, y, facing_index
    @maze = maze
    @xposition = x
    @yposition = y
    @facing_index = facing_index
  end

  def move_forward
    nextx, nexty = next_position
    if valid_position(nextx, nexty)
      @xposition = nextx
      @yposition = nexty
      puts "You move in to the next room"
    else
      puts "You bump into a wall"
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

  def next_position
    case facing
    when :north
      return [@xposition - 1, @yposition]
    when :east
      return [@xposition, @yposition + 1]
    when :south
      return [@xposition + 1, @yposition]
    when :west
      return [@xposition, @yposition - 1]
    end
  end

  def valid_position? x, y
    if x < 0 or y < 0 or x > (@width + 1) or y  > (@height + 1)
      false
    else
      true
    end
  end

end

class SquareMaze
  def initialize(width, height)
    @width = width
    @height = height
    @maze = []
    @height.times do |i|
      @maze[i] = []
      @width.times do |j|
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
