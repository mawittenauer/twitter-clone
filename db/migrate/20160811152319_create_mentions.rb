class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :tweet_id, :mentioned_id, :mentioner_id
      t.timestamps
    end
  end
end
