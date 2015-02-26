class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :admin
      t.integer :user_id

      t.timestamps
    end
  end
end
