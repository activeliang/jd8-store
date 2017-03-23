class WelcomeController < ApplicationController
  def index
    flash[:notice] = "你成功了！"
  end
end
