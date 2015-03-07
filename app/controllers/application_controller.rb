class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include EventsHelper
  include ApplicationHelper
  add_flash_types :error, :success, :notice

  helper_method :authorize_level?

  def next_day(day)
    date = Date.parse(day.to_s)
    date = date.next_week if date < Date.today
    return date
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
      redirect_to login_path, error: t('session.unauthorize')
    end
  end
end
