class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :custom_headers

    def custom_headers
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'POST, PATCH, GET'
      response.headers['Access-Control-Request-Method'] = '*'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      response.headers["Content-Type"] = "application/json"
    end
end
