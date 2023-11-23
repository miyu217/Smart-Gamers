class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_request, only: [:approve, :reject]

  def index
    @requests = Request.all
  end

  def approve
    if @request.approve!
      redirect_to new_game_path, notice: 'リクエストが承認されました。'
    else
      redirect_to admin_requests_path, alert: 'リクエストの承認に失敗しました。'
    end
  end

  def reject
    if @request.reject!
      redirect_to admin_requests_path, notice: 'リクエストが拒否されました。'
    else
      redirect_to admin_requests_path, alert: 'リクエストの拒否に失敗しました。'
    end
  end

  def update
    @request = Request.find(params[:id])

    if @request.update(approval: '承認済み')
      redirect_to admin_requests_path, notice: 'リクエストが承認されました。'
    else
      redirect_to admin_requests_path, alert: 'リクエストの承認に失敗しました。'
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'アクセス権限がありません。'
    end
  end
end
