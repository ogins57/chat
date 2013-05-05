class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :mail
      t.string :password

      t.timestamps
    end
  end
end
