class CreateDirectMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :direct_messages do |t|

      t.integer :from_id
      t.integer :to_id

      t.text :message

      t.timestamps
    end
  end
end
