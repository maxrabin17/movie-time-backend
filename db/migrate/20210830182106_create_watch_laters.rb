class CreateWatchLaters < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_laters do |t|
      t.string :title
      t.string :poster

      t.timestamps
    end
  end
end
