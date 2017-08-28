class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :author
      t.string :menu_image

      t.timestamps
    end
  end
end
