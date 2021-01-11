class Admin::ManagementsController < ApplicationController
  before_action :not_admin
  before_action :set_article

  private

  def not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
