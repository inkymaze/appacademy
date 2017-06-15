class RemoveUniqueVisitId < ActiveRecord::Migration[5.0]
  def change
    remove_index :visits, :user_id
    remove_index :visits, :shortened_url_id
    add_index :visits, :user_id
    add_index :visits, :shortened_url_id
  end
end
