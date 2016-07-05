class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :number
      t.string :text
      t.boolean :inbound

      t.timestamps
    end
  end
end
