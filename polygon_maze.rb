class PolygonMaze
  class Room
    def initialize
      @contents = []
      @links = []
    end
    def link_room n
      @links.push(n)
    end
    def to_s
      @links.to_s
    end
  end

  def initialize n
    @polygon_sides = n
    @rooms = []
    link_rooms
  end

  def to_s
    s = "["
    @rooms.each_with_index do |room, index|
      s += "#{index}:#{room.to_s}, "
    end
    return s[0..-3] + "]"
  end

  def link_rooms
    @polygon_sides.times do |i|
      @rooms[i] = Room.new
      @rooms[i].link_room((i - 1 + @polygon_sides) % @polygon_sides)
      @rooms[i].link_room((i + 1) % @polygon_sides)
    end
    @polygon_sides.times do |i|
      polygon_link i, ((i+1) % @polygon_sides)
    end
  end

  def polygon_link first_ind, last_ind
    ci = @rooms.length
    (@polygon_sides - 2).times do |i|
      @rooms[ci + i] = Room.new
      current = @rooms[ci + i]
      if i == 0 and i == (@polygon_sides - 3)
        @rooms[first_ind].link_room(ci + i)
        @rooms[last_ind].link_room(ci + i)
        current.link_room(first_ind)
        current.link_room(last_ind)
      elsif i == 0
        @rooms[first_ind].link_room(ci + i)
        current.link_room(first_ind)
        current.link_room(ci + i + 1)
      elsif i == (@polygon_sides - 3)
        current.link_room(ci + i - 1)
        current.link_room(last_ind)
        @rooms[last_ind].link_room(ci + i)
      else
        current.link_room(ci + i - 1)
        current.link_room(ci + i + 1)
      end
    end
  end

  def number_of_rooms
    n = @polygon_sides
    n + ((n-1) * n - n)
  end
end

puts PolygonMaze.new(8)
