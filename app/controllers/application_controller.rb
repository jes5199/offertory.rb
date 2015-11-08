class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def current_clef_user
    ClefUser.new(session[:clef_access_token]) if session[:clef_access_token]
  end

  def become_clef_user(access_token)
    session[:person_id] = nil
    session[:clef_access_token] = response['access_token']
  end

  def current_user
    if not @current_user
      if session[:person_id]
        @current_user = Person.find(session[:person_id])
      else
        if not current_clef_user
          return nil
        end
        @current_user = current_clef_user.person
        session[:person_id] = @current_user.id
      end
    return @current_user
  end
end
