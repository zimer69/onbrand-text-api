class CreateTones < ActiveRecord::Migration[7.0]
  def change
    create_table :tones do |t|
      t.string :politeness
      t.string :verbosity
      t.string :emotionality
      t.string :humor
      t.string :positivity
      t.boolean :sci_fi
      t.boolean :philosophical
      t.boolean :poetic

      t.timestamps
    end
  end
end
