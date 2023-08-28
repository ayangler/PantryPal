class YoursController < ApplicationController
  before_action :authenticate_user!

  def profile
    @account = current_user
  end
end
