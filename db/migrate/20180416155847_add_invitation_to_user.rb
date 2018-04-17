class AddInvitationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :invitation_id, :integer,  default: nil
  end
end
