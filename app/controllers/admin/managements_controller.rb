class Admin::ManagementsController < ApplicationController
  before_action :not_admin

  def index
    @articles = Article.all.order('created_at DESC').includes(:user)
  end

  private

  def not_admin
    redirect_to root_path unless current_user.admin?
  end

end
