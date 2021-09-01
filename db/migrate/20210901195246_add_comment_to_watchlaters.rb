class AddCommentToWatchlaters < ActiveRecord::Migration[6.1]
  def change
    add_column :watch_laters, :comment, :string
  end
end
