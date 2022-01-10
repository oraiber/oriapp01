class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :tweet

      t.timestamps
      t.index [:user_id, :tweet_id], unique: true
    end
  end
end
