# frozen_string_literal: true

module BaseApi
  # Handles user authentication (login, logout)
  module Auth
    def self.login(email, password)
      # will return nil if no user found, will return false if the try authenticate doesn't work
      client = Client.find_by(email: email).try(:authenticate, password)

      # If we couldn't find the user
      return ServiceContract.error('Client not found') if client.nil?

      # If the password wasn't correct
      return ServiceContract.error('Incorrect password') unless client

      # generate the token on the user obj
      client.generate_token!
      ServiceContract.success(user)
    end

    def self.logout(client)
      return ServiceContract.success(true) if client.update(token: nil)

      ServiceContract.error('Error logging client out')
    end
  end
end
