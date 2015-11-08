class ClefController < ApplicationController
  def return
    code = params[:code]
    data = { body: {
      code: code,
      app_id: CLEF_APPLICATION_ID,
      app_secret: CLEF_APPLICATION_SECRET
    } }
    response = HTTParty.post(CLEF_AUTHORIZE_URL, data)

    if response['success']
      if response['state'] != session[:clef_state]
        raise Exception.new("Clef Mismatch")
      end
      session[:clef_access_token] = response['access_token']
      render text: response.inspect
    else
      raise Exception.new("Clef Error: #{response['error']}")
    end
  end
end
