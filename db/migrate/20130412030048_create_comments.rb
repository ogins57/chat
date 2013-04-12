class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.text :body
      t.references :tweet

      t.timestamps
    end
    add_index :comments, :tweet_id
  end
end
