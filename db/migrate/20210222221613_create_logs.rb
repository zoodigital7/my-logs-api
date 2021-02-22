class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :error_type
      t.string :error_code
      t.string :error_message
      t.jsonb :stack_trace
      t.references :client
      t.timestamps
    end
  end
end
