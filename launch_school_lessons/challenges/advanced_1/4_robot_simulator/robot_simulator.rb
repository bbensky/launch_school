class Robot
  BEARINGS = { east: [:south, :north], west: [:north, :south], 
               north: [:east, :west], south: [:west, :east] }

  attr_reader :bearing, :coordinates

  def orient(direction)
    @bearing = direction if valid_bearing?(direction)
  end

  def turn_right
    @bearing = BEARINGS[bearing][0]
  end

  def turn_left
    @bearing = BEARINGS[bearing][1]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case bearing
    when :east  then coordinates[0] += 1
    when :west  then coordinates[0] -= 1
    when :north then coordinates[1] += 1
    when :south then coordinates[1] -= 1
    end
  end

  private

  def valid_bearing?(direction)
    if BEARINGS.keys.include?(direction)
      true
    else
      raise ArgumentError, 'Invalid Direction'
    end
  end
end

class Simulator
  def instructions(instruction_string)
    result = []

    instruction_string.each_char do |letter|
      case letter
      when 'L' then result << :turn_left
      when 'R' then result << :turn_right
      when 'A' then result << :advance
      end
    end

    result
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instruction_string)
    commands = instructions(instruction_string)
    
    commands.each { |command| robot.send command }
  end
end
