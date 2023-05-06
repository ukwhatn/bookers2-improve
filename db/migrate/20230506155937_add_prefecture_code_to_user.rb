class AddPrefectureCodeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :prefecture_code, :integer
  end
end
