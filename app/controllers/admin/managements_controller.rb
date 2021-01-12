class Admin::ManagementsController < ApplicationController
  before_action :not_admin

  def index
    @users = User.all.order('created_at DESC')
    @articles = Article.all.order('created_at DESC').includes(:user)
    @tags = Tag.all.order('created_at DESC')
  end

  private

  def not_admin
    redirect_to root_path unless current_user.admin?
  end

end
