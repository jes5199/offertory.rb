require 'securerandom'
class WelcomeController < ApplicationController
  def front
    session[:clef_state] ||= SecureRandom.uuid
    @clef_state = session[:clef_state]
  end
end
