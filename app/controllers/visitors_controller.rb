# frozen_string_literal: true

class VisitorsController < ApplicationController
  def index
    @users = User.all
  end
end
