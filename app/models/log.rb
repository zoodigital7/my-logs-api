# == Schema Information
#
# Table name: logs
#
#  id            :bigint           not null, primary key
#  error_type    :string
#  error_code    :string
#  error_message :string
#  stack_trace   :jsonb
#  client_id     :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Log < ApplicationRecord
    belongs_to :client    
end
