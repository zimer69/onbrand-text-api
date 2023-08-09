class CreateTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :texts do |t|
      t.string :content
      t.integer :characters

      t.timestamps
    end
  end
end
