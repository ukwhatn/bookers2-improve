class CreateViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :view_counts do |t|

      t.integer :book_id, null: false
      t.integer :count, default: 0, null: false

      t.timestamps
    end
  end
end
