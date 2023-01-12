# frozen_string_literal: true

class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def confirm_order
    @amount = params[:orders][:amount].to_i
    @attachment_amount = params[:attachment_amount].to_i
    @attachment_id = params[:attachment_id].to_i
    @attachment = Attachment.find_by_id(@attachment_id)
  end

  def new
    @attachment = Attachment.find(params[:attachment])
  end

  def create
    @amount = params[:orders][:amount].to_i
    @attachment_amount = params[:attachment_amount].to_i
    @attachment_id = params[:attachment_id].to_i
    @attachment = Attachment.find_by_id(@attachment_id)
    if @amount.zero?
      redirect_back fallback_location: root_path, alert: 'Enter some amount to order.'
    elsif @attachment_amount < @amount
      redirect_back fallback_location: root_path, alert: "Given amount not available. max amount available for this attachment: #{@attachment_amount}"
    else
      @attachment_amount -= @amount
      @attachment.update_attachment_after_order(@attachment_amount)
      redirect_to root_path, notice: 'order was successfully created'
    end
  end
end
