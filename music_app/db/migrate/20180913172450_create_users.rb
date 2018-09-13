class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true # why is this unique? doesn't it change as much as password_digest?
    # don't search by password_digest anywhere. In theory you
    # could index+unique by password_digest if needed
    # both session_token and password_digest have near 0 chances of duplicating
  end
end
