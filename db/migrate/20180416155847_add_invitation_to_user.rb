class AddInvitationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :user_id, :integer,  default: nil
  end
end
