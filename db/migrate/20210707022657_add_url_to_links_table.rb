class AddUrlToLinksTable < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :url, :text
  end
end
