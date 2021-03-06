class ContractsController < ApplicationController
  def create
    coders = Coder.find(session[:team].keys)
    contract = current_user.contracts.create
    contract.set_teammates(coders)
    SmsSender.new(@team.total_cost).send_sms
    session[:team].clear
    flash[:message] = "Team successfully created."
    redirect_to history_path
  end

  def show
    if current_user
      @contract = current_user.contracts.find(params[:id])
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def index
    if current_user
      @contracts = current_user.contracts.ordered
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end
end
