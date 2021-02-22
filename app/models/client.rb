# == Schema Information
#
# Table name: clients
#
#  id              :bigint           not null, primary key
#  name            :string
#  client_id       :string
#  email           :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Client < ApplicationRecord
    has_many :logs
    validates :email, uniqueness: true

    def generate_token!
        update_attribute :token, BaseApi::AccessToken.generate(self)
    end
    
end
