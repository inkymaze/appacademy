class AddSubmitterId < ActiveRecord::Migration[5.0]
  def change
    add_column :shortened_urls, :submitter_id, :integer, null: false 
  end
end
