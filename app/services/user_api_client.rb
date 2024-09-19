require "httparty"

class UserApiClient
  include HTTParty
  base_uri "https://gist.githubusercontent.com"

  def fetch_employees
    response = self.class.get("/alhafoudh/e46f708609366c762b7314e98aa213b9/raw/08e34a18eba801791c0b2557e1705e917a4b79bb/freevision_employees.json")

    if response.success?
      JSON.parse(response.body)["employees"] # Ensure JSON is parsed correctly
    else
      Rails.logger.error "Failed to fetch employees: #{response.code} #{response.message}"
      { "employees" => [] }
    end
  end
end
