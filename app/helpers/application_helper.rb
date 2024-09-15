module ApplicationHelper
  def custom_date(datetime)
    return "just now" if datetime > Time.current
    distance_in_minutes = ((Time.current - datetime) / 60).to_i

    case distance_in_minutes
    when 0..59
      "#{distance_in_minutes} minute#{'s' if distance_in_minutes != 1} ago"
    when 60..1439
      hours = distance_in_minutes / 60
      "#{hours} hour#{'s' if hours != 1} ago"
    when 1440..2879
      "yesterday"
    else
      datetime.strftime("%m/%d")
    end
  end
end
