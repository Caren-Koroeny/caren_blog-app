class AddUserRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :post, :user, null: false, foreign_key: true
  end
end
