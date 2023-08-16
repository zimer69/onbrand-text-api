class ChangeColumnsInTone < ActiveRecord::Migration[7.0]
  COLUMNS = %i[politeness verbosity emotionality humor positivity]

  def change
    COLUMNS.each do |column|
      change_column :tones, column, :integer, default: 0, null: false, using: "#{column}::integer"
    end
  end
end
