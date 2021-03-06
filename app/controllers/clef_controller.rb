class ClefController < ApplicationController
  def return
    code = params[:code]
    data = { body: {
      code: code,
      app_id: CLEF_APPLICATION_ID,
      app_secret: CLEF_APPLICATION_SECRET
    } }

    if params['state'] != session[:clef_state]
      raise Exception.new("Clef Mismatch #{response['state']} != #{session[:clef_state]}")
    end

    response = HTTParty.post(CLEF_AUTHORIZE_URL, data)

    if response['success']
      become_clef_user(response['access_token'])
      render text: current_user.name
    else
      raise Exception.new("Clef Error: #{response['error']}")
    end
  end
end
