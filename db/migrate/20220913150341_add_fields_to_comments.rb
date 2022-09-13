class AddFieldsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :AuthorId, :integer
    add_column :comments, :PostId, :integer
  end
end
