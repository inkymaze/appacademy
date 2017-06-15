class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :question_id, null: false
      t.integer :answerchoice_id, null: false
      t.timestamps
    end
  end
end
