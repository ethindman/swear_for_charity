class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gravatar
      t.text :description
      t.string :encrypted_password
      t.string :hash_key

      t.timestamps null: false
    end
  end
end
