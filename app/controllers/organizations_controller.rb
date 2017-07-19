class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.owner = current_user
    if @organization.save
      flash[:success] = 'Your organization has been successfully created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end
end
