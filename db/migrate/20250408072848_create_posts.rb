class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.integer :score
      t.timestamps
    end
  end
end
