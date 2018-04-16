class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:destroy]

  # GET /invitations
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # POST /invitations
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to @invitation, notice: 'Invitation was successfully created.'
    else
      render :new
    end
  end


  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    redirect_to invitations_url, notice: 'Invitation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invitation_params
      params.require(:invitation).permit(:email_recipient)
    end
end
