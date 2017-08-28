class CreateStoryContents < ActiveRecord::Migration[5.0]
  def change
    create_table :story_contents do |t|
      t.string :title
      t.string :body
      t.belongs_to :language, foreign_key: true
      t.belongs_to :story, foreign_key: true

      t.timestamps
    end
  end
end
