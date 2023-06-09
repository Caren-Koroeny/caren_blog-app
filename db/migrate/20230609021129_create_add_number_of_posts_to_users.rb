# frozen_string_literal: true

class CreateAddNumberOfPostsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_counter, :integer, default: 0
  end
end