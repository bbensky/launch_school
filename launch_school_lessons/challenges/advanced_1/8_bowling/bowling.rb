# record a throw in a frame
  # frames are either two throws or one throw
  # if frames array is empty, or the last frame has 2 elements, 
    # push the first throw as a new_array
  # if last frame has only one element and it's not a 10 add the current throw
    # to that array

class Game

  def initialize
    @frames = []
  end

  def roll(pins)
    if !valid_pins?(pins)
      raise RuntimeError, 'Pins must have a value from 0 to 10' 
    elsif game_over?
      raise RuntimeError, 'Should not be able to roll after game is over'
    end

    add_to_frame(pins)

    if !valid_frame?
      raise RuntimeError, 'Pin count exceeds pins on the lane'
    end
  end

  def score
    if @frames.size < 10 || !valid_tenth_frame?
      raise RuntimeError, 'Score cannot be taken until the end of the game'
    elsif frame_score(9) == 10
      if (@frames.size == 10) || !fill_balls_played? 
        raise RuntimeError, 'Game is not yet over, cannot score!'
      end
    end

    score = 0

    @frames.each_with_index do |frame, idx|
      return score if idx > 9 && valid_frame?

      if frame[0] == 10
        score += 10 + frame_score(idx+1)
        score += @frames[idx+2][0] if @frames[idx+1][0] == 10 
      elsif frame_score(idx) == 10
        score += 10 + @frames[idx+1][0]
      else
        score += frame_score(idx)
      end
    end

    score
  end

  private

  def valid_pins?(pins)
    (0..10).include?(pins)
  end

  def game_over?
    if @frames.size < 10
      false
    elsif @frames[9] == 10 && @frames.size == 12
      true
    elsif frame_score(9) == 10 && @frames[9].size == 2 && @frames.size == 11
      true
    elsif @frames.size == 10 && @frames[9].size == 2 && frame_score(9) != 10
      true
    else
      false
    end 
  end

  def valid_frame?
    @frames.last.reduce(:+) <= 10
  end

  def valid_tenth_frame?
    @frames[9] && (@frames[9][0] == 10 || @frames[9].size == 2)
  end

  def add_to_frame(pins)
    if @frames.empty? || @frames.last.size == 2 || @frames.last[0] == 10
      @frames << [pins]
    else
      @frames[-1] = [@frames.last[0], pins]
    end   
  end

  def fill_balls_played?
    (@frames[9][0] == 10 && @frames[10][0] == 10 && @frames.size == 12) ||
    (@frames[9][0] == 10 && @frames[10].size == 2 && @frames.size == 11) ||
    (frame_score(9) == 10 && @frames[9].size == 2 && @frames.size == 11)
  end

  def frame_score(idx)
    @frames[idx].reduce(:+)
  end
end
