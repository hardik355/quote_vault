class ApiKeyAuthenticator
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    api_key = request.get_header("HTTP_API_KEY")

    Rails.logger.info "--- ApiKeyAuthenticator api_key #{api_key} initialize ----"
    # Check if the API key matches the expected value

    if api_key == ENV["VALID_API_KEY"]
      @app.call(env)
    else
      [401, { "Content-Type" => "application/json" }, [{ error: "Unauthorized" }.to_json]]
    end
  end
end
