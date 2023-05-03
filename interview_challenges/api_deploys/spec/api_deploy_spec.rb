require './lib/api_deploy'
require './lib/api_call'

RSpec.describe ApiDeploy do
  before :each do
    @url = 'https://gist.githubusercontent.com/gretchenziegler/853c4f709d45176aa44c8e5aee864cac/raw/010a4c44455ffc93b8039935cfc4e0dff41ae502/hcsc.json'
    @result = ApiCall.conn(@url)
    @deployed = ApiDeploy.new(@result)
  end

  it 'exists' do
    expect(@deployed).to be_a(ApiDeploy)
  end

  it '#platform_api_deploy_dates' do
    expect(@deployed.platform_api_deploy_dates).to be_an Array
    expect(@deployed.platform_api_deploy_dates.length).to eq(14)
    expect(@deployed.platform_api_deploy_dates.first).to eq('2020-03-31T13:50:57.065Z')
    expect(@deployed.platform_api_deploy_dates.last).to eq('2016-07-27T23:44:45.461Z')
  end
end