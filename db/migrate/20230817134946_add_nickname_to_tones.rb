class AddNicknameToTones < ActiveRecord::Migration[7.0]
  def change
    add_column :tones, :nickname, :string
  end
end
