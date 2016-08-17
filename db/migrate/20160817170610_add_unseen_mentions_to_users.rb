class AddUnseenMentionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unseen_mentions, :integer, default: 0
  end
end
