# frozen_string_literal: true

# Defines the JSON blueprint for the Client model
class ClientBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :email, :client_id
  view :login do
    field :token
  end
end
