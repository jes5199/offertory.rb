require 'securerandom'
class WelcomeController < ApplicationController
  def front
    session[:clef_state] ||= SecureRandom.uuid
    render locals: {clef_state: session[:clef_state]}
  end
end
