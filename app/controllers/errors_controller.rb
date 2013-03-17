class ErrorsController < ApplicationController
  def error_404
    @not_found_path = env["action_dispatch.exception"]
  end

  def error_500
  end
end
