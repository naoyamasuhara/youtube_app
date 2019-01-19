class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :content
      t.string :youtube_uuid
      t.bigint :user_id, null: false
      t.timestamps
    end
  end
end