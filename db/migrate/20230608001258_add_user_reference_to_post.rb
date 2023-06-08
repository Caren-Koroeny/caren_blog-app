class AddUserReferenceToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    t.references :author, foreign_key: { to_table: 'users' }
  end
end
