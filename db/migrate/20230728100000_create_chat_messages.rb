class CreateChatMessages < ActiveRecord::Migration[7.0]
    def change
      create_table :chat_messages do |t|
        t.references :user, foreign_key: true
        t.string :message
        t.boolean :is_user_message, default: true
  
        t.timestamps
      end
    end
end