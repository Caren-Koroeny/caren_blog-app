class AddPostRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: true
    t.references :author, foreign_key: { to_table: 'users' }
  end
end
