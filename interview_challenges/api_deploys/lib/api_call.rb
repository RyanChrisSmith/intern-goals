require 'faraday'

class ApiCall

  def self.conn(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end
end