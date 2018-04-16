require 'test_helper'

class InvitationTest < ActiveSupport::TestCase

    def setup
        Invitation.delete_all
        @invitation = Invitation.new(email_recipient: "test@test.com")
    end

    test "invitation should be valid" do
        assert @invitation.valid?
    end

    test "invitation have a valid recipient email" do
        invitation = Invitation.new(email_recipient: "test_test.com")
        assert_not invitation.valid?
    end

    test "invitation email recipient should be unique" do
        @invitation.save
        invitation = Invitation.new(email_recipient: "test@test.com")
        assert_not invitation.valid?
    end

    test "new invitations are not be accepted" do
        assert_not @invitation.accepted?
    end

    test "invitations could  be accepted" do
        @invitation.accepted = true
        assert @invitation.accepted?
    end

    test "inivitations have a token" do
        assert_not_nil @invitation.token
    end

    test "invitations tokens are diferent" do

        @invitation.save

        invitation = Invitation.new(email_recipient: "test2@test.com")

        assert_not invitation.token == @invitation.token

    end

    test "invitations always have same token" do
        @invitation.save

        invitation_recovered = Invitation.find @invitation.id

        assert invitation_recovered.token == @invitation.token
    end

end
