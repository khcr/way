class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include EventsHelper
  include ApplicationHelper
  add_flash_types :error, :success, :notice

  helper_method :authorize_level?

  def next_day(day, from=Date.today)
    wday = Date::DAYNAMES.find_index(day.to_s.capitalize)
    return from.next_day(wday)
  end

  def next_event(from=Date.today)
    date = next_day(:saturday, from)
    puts date
    event = Event.where(date: Date.today..date).first
    if event && event.date == date && event.remove
      event, date = next_event(date.next_day)
    elsif event && event.date < date
      date = event.date
    end
    return event, date
  end

  # Store the current url in session's variable
  # 
  # * *Args*    :
  # 
  # * *Returns* :
  #
  def store_location
    cookies[:return_to] = { value: request.fullpath, expires: 1.minute.from_now }
  end

  # Redirect the user to the stored url or the default one provided
  # 
  # * *Args*    :
  #   - default path to redirect to
  # * *Returns* :
  #
  def redirect_back_or(default, message = nil)
    redirect_to(cookies[:return_to] || default, message)
    session.delete(:return_to)
  end

  def authorize_level?(level = 4)
    current_user && current_user.level <= level
  end

  def authorize_level(level = 4)
    unless authorize_level?(level)
      store_location
      redirect_to login_path, error: "Pas autorisé"
    end
  end
end
