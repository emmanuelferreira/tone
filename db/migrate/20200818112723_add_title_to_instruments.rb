class AddTitleToInstruments < ActiveRecord::Migration[6.0]
  def change
    add_column :instruments, :title, :string
  end
end
