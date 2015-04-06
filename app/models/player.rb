# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ActiveRecord::Base
  has_many :training_loads

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_7_training_loads(date)
    start = date - 6.days
    (start..date).map {|day| day_load(day)}
  end

  def piecewise_chart
    chart = [['Day', 'Today', 'Residual']]
    date_start = Date.parse("2015-01-25")
    date_end = Date.parse("2015-03-20")
    (date_start..date_end).each do |day|
      chart.append([day, day_load(day), residual(day)[:residual] ])
    end

    chart
  end

  def sore_chart
    [{}]
  end

  def recovery_days(date)
    residual_loads = residual(date)

    if residual_loads[:residual] == 0
      return 0
    elsif (residual_breakdown(residual_loads[:day2], "day3") +
           residual_breakdown(residual_loads[:day1], "day2") +
           residual_breakdown(residual_loads[:day0], "day1") ) == 0
      return 1
    elsif (residual_breakdown(residual_loads[:day1], "day3") +
           residual_breakdown(residual_loads[:day0], "day2") ) == 0
      return 2
    elsif residual_breakdown(residual_loads[:day0], "day3") == 0
      return 3
    else
      return 4
    end

  end

  def residual(date)
    day3 = residual_breakdown(day_load(date - 3.days), "day3")
    day2 = residual_breakdown(day_load(date - 2.days), "day2")
    day1 = residual_breakdown(day_load(date - 1.days), "day1")
    day0 = day_load(date)
    residual = day0 + day1 + day2 + day3

    {:day3 => day3, :day2 => day2, :day1 => day1, :day0 => day0, :residual => residual}
  end

  def day_load(date)
    training_loads.where(date: date).map(&:value).reduce(0, :+)
  end

  def to_s
    full_name
  end

  private

  def residual_breakdown(load, day)

    case day
      when "day3"
        if load > 750
          return load*0.1
        elsif load > 250
          return load*0.05
        else
          return 0
        end
      when "day2"
        if load > 750
          return load*0.2
        elsif load > 250
          return load*0.15
        else
          return load*0.1
        end
      when "day1"
        if load > 750
          return load*0.4
        elsif load > 250
          return load*0.3
        else
          return load*0.2
        end
      else
        return 0
    end

  end
end
