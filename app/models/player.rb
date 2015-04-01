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

  def recovery_days
    99
  end

  def day_load(date)
    training_loads.where(date: date).map(&:value).reduce(0, :+)
  end

  def to_s
    full_name
  end

end
