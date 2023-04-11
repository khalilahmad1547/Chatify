class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false, default: ''
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.belongs_to :conversation
      t.timestamps
    end
  end
end
