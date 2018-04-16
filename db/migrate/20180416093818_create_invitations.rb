class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :email_recipient, null: false
      t.string :token, null: false
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
