# methods
  # self.at
    # returns total minutes

require 'pry'

class Clock
  MINUTES_IN_HOUR = 60
  attr_reader :minutes

  def initialize(hour, minutes)
    @minutes = hour * 60 + minutes 
  end

  def self.at(hour, minutes=0)
    new(hour, minutes)
  end

  def + minutes
    Clock.new(0, @minutes + minutes)
  end

  def - minutes
    Clock.new(0, @minutes - minutes)
  end

  def to_s
    total_minutes = clean_minutes
    hours, minutes = total_minutes.divmod(MINUTES_IN_HOUR)

    format("%02d:%02d", hours, minutes)
  end

  def == other_clock
    minutes == other_clock.minutes
  end

  private

  def clean_minutes
    if @minutes >= 1440
      @minutes - 1440
    elsif @minutes < 0
      @minutes + 1440
    else
      @minutes
    end
  end
end

clock = Clock.at(10) - 90
p clock.to_s
