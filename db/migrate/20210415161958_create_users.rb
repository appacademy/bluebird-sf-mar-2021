class CreateUsers < ActiveRecord::Migration[5.2]
  # DO NOT EVER EIDT A MIGRATION FILE THAT IS STATUS: UP!!!
  # DO NOT EVER DELETE A MIGRATION! DON'T DO IT!!!
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      # datatype | column name | optional restrictions
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    # command | table | column name | restriction
  end
end
