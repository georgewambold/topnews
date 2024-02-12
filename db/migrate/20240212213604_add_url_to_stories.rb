class AddUrlToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :url, :string, null: false, index: false
  end
end