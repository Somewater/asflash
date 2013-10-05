class PortfolioController < ApplicationController
  
  def show
    @portfolio = Portfolio.where(['name = ?', params[:id]]).first
  end
end
