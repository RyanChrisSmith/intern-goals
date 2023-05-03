require './lib/api_call'

RSpec.describe ApiCall do
  context 'API call' do
    before :each do
      @url = "https://gist.githubusercontent.com/gretchenziegler/853c4f709d45176aa44c8e5aee864cac/raw/010a4c44455ffc93b8039935cfc4e0dff41ae502/hcsc.json"
      @result = ApiCall.conn(@url)
    end

    it 'will successfully connect to the URL and return a hash of data' do
      expect(@result).to be_a Hash
    end

    it 'will return a hash with the necessary keys to access the desired data' do
      expect(@result).to have_key("client_environments")
      expect(@result["client_environments"]).to be_an Array

      @result["client_environments"].each do |environment|
        expect(environment).to have_key("most_recent_deploys")
        expect(environment["most_recent_deploys"]).to be_a Hash

        expect(environment["most_recent_deploys"]).to have_key("platform-api")
        expect(environment["most_recent_deploys"]["platform-api"]).to be_a Hash

        expect(environment["most_recent_deploys"]["platform-api"]).to have_key("deployed_at")
        expect(environment["most_recent_deploys"]["platform-api"]["deployed_at"]).to be_a String
      end
    end
  end
end