require './lib/api_deploy'
require './lib/api_call'

url = 'https://gist.githubusercontent.com/gretchenziegler/853c4f709d45176aa44c8e5aee864cac/raw/010a4c44455ffc93b8039935cfc4e0dff41ae502/hcsc.json'

api_data = ApiCall.conn(url)
api_deploy = ApiDeploy.new(api_data)

deploy_dates = api_deploy.platform_api_deploy_dates

p deploy_dates