class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :tag, :email, :password_digest
      t.timestamps
    end
  end
end
