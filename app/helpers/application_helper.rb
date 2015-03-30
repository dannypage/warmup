module ApplicationHelper
  def load_sparkline(player)
    max_spark_height = 30
    load_values = player.last_7_training_loads.map(&:value)
    max_value = load_values.max
    lines = load_values.map { |value|
      pixels = (( value.to_f / max_value) * max_spark_height ).round
      %Q[<div style="background-color: black; display: inline-block; height: #{pixels}px; width: 4px; margin-right: 1px;"></div>]
    }.join('')

    %Q[<div style="height: #{max_spark_height}px;">#{lines}</div>].html_safe
  end
end
