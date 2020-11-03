class StocksController < ApplicationController
    def search
        if params[:stock].blank?
            flash.now[:danger] = "Try again, This time look for a stock symbol like 'GOOG', 'AAPL' or 'TSLA'"
        else
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "The Symbol You were looking for, Does not exist. Try: 'GOOG', 'AAPL' or 'TSLA'" unless @stock
        end
        respond_to do |format|
        format.js { render partial: 'users/result' }
        end
    end
end