class AddByToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :by, :string
  end
end
