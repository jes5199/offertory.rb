class ClefUser
  def initialize(access_token)
    @access_token = access_token
    @data = nil
  end

  def data
    return @data if @data
    response = HTTParty.get(CLEF_INFO_URL, options: {access_token: @access_token})
    if response["success"]
      @data = response["info"]
    else
      raise Exception.new("Clef Error: #{response["error"]}")
    end
  end

  def clef_id
    self.data['id']
  end
end
