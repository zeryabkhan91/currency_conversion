class ApplicationController < ActionController::Base
  def index
    @currnecies = SUPPORTED_CURRENCIES.map { |currency| currency[:title] }
  end

  def convert_to_cents
    currency = SUPPORTED_CURRENCIES.select { |c| c[:title] == params[:currency] }.first
    if currency
      @calculated_cents = (params[:amount].to_f * currency[:cent_multiplier]).round(0)
    else
    end
  end
end
