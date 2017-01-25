class ApplicationController < ActionController::Base
  #disregard crsf threats if json api call
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

end
