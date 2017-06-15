class AddUserId < ActiveRecord::Migration[5.0]
  def change
    remove_column :responses, :question_id, :integer
    add_column :responses, :user_id, :integer, null: false, unique: false

  end
end
