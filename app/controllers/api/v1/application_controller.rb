class Api::V1::ApplicationController < ActionController::API
    # include ActionController::HttpAuthentication::Token::ControllerMethods
  
    # before_action :authenticate
  
    def authenticate
      authenticate_token || render_unauthorized
    end
  
    def authenticate_token
      authenticate_with_http_token do |token, _options|
        @current_user = User.find_by(token: token)
        @current_user
      end
    end
  
    def render_unauthorized
      logger.debug "*** UNAUTHORIZED REQUEST: '#{request.env['HTTP_AUTHORIZATION']}' ***"
      headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: { error: 'Bad credentials' }, status: 401 and return
    end
  
    def ensure_required_params(required_params, passed_in_params)
      required_params = required_params.map(&:to_sym)
      passed_in_params = passed_in_params.keys.map(&:to_sym)
  
      remainder = required_params - passed_in_params
  
      count = remainder.size
      errors = remainder
  
      render json: { message: "Missing required parameters: #{errors.to_sentence}" }, status: :bad_request and return unless count.zero?
    end
  
    def render_error(errors:, status: :internal_server_error)
      render json: {
        success: false,
        errors: errors
      }, status: status
    end
  
    def render_success(payload:, status: :ok)
      render json: {
        success: true,
        payload: payload
      }, status: status
    end
  end
  