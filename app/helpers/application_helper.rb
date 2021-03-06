module ApplicationHelper

  def current_path(path)
    "current" if current_page?(path)
  end

  def time_ago time
    "#{time_ago_in_words(time)} ago"
  end

  def time_until time
    "for #{distance_of_time_in_words(Time.now, time)}"
  end

end
