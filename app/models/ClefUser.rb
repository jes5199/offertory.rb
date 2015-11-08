class ClefUser
  def initialize(access_token)
    @access_token = access_token
    @data = nil
  end

  def data
    return @data if @data
    response = HTTParty.get(CLEF_INFO_URL, query: {access_token: @access_token})
    if response["success"]
      @data = response["info"]
    else
      raise Exception.new("Clef Error: #{response["error"]} for #{@access_token}")
    end
  end

  def clef_id
    self.data['id']
  end

  def email
    self.data['email']
  end

  def name
    self.data['first_name']
  end

  def person_info
    {
      email: self.email,
      name: self.name
    }
  end

  def person
    Person.create_with(person_info).find_or_create_by(clef_id: clef_id)
  end
end
