class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body,null:false
      t.references :conversation, null:false,foreign_key: true
      t.references :user, null:false,foreign_key: true
      t.boolean :read,null:false,default:false

      t.timestamps
    end
  end
end
