module Api 
    module V1 
        # Handles endpoints related to logs
        class LoggingController < Api::V1::ApplicationController
            def createLog
                result = LoggingApi::Logs.create_log(params[:clientId], params[:error], params[:stackTrace])
                render_error(errors: 'Client not found', status: 404) and return unless result.success?
                render_success(payload: { msg: 'Log Created'})
            end
        end
    end
end