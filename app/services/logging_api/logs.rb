module LoggingApi
    # Handles creating Logs
    module Logs
      def self.create_log(clientId, error, stackTrace)
        # will return nil if no user found, will return false if the try authenticate doesn't work
        client = Client.find_by(client_id: clientId)
  
        # If we couldn't find the client
        return ServiceContract.error('Client not found') if client.nil?
        error_type = error.errorType 
        error_code = error.errorCode
        error_message = error.errorMessage
        log = client.logs.create(error_type: error_type, error_code: error_code, error_message: error_message)
        ServiceContract.success(true) unless !log.save 
      end
  
    end
  end