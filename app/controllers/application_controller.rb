class ApplicationController < ActionController::Base

  # skip_before_action :verify_authenticity_token

  def index
    @currnecies = SUPPORTED_CURRENCIES.map { |currency| currency[:title] }
  end

  def convert_to_cents
    currency = SUPPORTED_CURRENCIES.select { |c| c[:title] == params[:currency] }.first
    if currency
      @calculated_cents = (params[:amount].to_f * currency[:cent_multiplier]).round(0).to_s(:delimited)
    end
    @currency_conversion_history = CurrencyConversionHistory.new
    respond_to do |format|
      format.js
    end
  end
end
