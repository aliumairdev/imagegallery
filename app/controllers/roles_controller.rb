# frozen_string_literal: true

class RolesController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    @role = Role.create(role_params)
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully added.' }
      else
        format.html { render :new, alert: 'Role not added.' }
      end
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      redirect_to role_path(@role)
    else
      render :edit
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    redirect_to roles_path
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
