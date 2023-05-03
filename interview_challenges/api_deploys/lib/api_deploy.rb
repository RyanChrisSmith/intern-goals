class ApiDeploy

  def initialize(api_data)
    @api_data = api_data
  end

  def platform_api_deploy_dates
    @api_data["client_environments"].map do |environment|
      environment["most_recent_deploys"]["platform-api"]["deployed_at"]
    end
  end
end