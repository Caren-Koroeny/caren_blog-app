class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :name
      t.text :bio
      t.string :email
      t.text :photo
      t.integer :post_counter

      t.timestamps
    end
  end
end
