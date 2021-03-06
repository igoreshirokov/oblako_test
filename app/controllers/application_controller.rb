class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :cors_preflight_check
    after_action :cors_set_access_control_headers

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PATCH, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = "1728000"
    end

    def cors_preflight_check
      if request.method == 'OPTIONS'
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PATCH, GET, PUT, DELETE, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
        headers['Access-Control-Max-Age'] = '1728000'
      
        render :text => '', :content_type => 'text/plain'
      end
    end
    
    
    # before_action :custom_headers

    # def custom_headers
      # response.set_header('Access-Control-Allow-Origin', '*')
      # response.headers['Access-Control-Allow-Origin'] = '*'
      # response.headers['Access-Control-Allow-Methods'] = 'POST, PATCH, GET, OPTIONS'
      # response.headers['Access-Control-Request-Method'] = '*'
      # # headers['Access-Control-Request-Method'] = '*'
      # response.headers['Access-Control-Allow-Headers'] = '*'
      # # response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      # response.headers["Content-Type"] = "application/json"
    # end
end
