class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.string :Text
      t.string :CreatedAt
      t.string :UpdatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamp
    end
  end
end
