class CurrencyConversionHistoriesController < ApplicationController
  before_action :set_currency_converion_history, only: [:destroy]

  def create
    api_key = '2dae2e7e775096abe5c3e5eb'
    url = "https://v6.exchangerate-api.com/v6/#{api_key}/latest/#{currency_conversion_params[:source_currency]}"
    response = Excon.get(url)
    conversion_rate = JSON.parse(response.body)['conversion_rates'][currency_conversion_params[:converted_curreny]]

    converted_amount = currency_conversion_params[:source_currency_value].to_f * conversion_rate
    @conversion_rate_history = CurrencyConversionHistory.new(currency_conversion_params)
    @conversion_rate_history.converted_currency_value = converted_amount
    @conversion_rate_history.save

    redirect_back fallback_location: root_url
  end

  def destroy
    @currency_conversion_history.destroy
    redirect_back fallback_location: root_url
  end

  def currency_conversion_params
    params.require(:currency_conversion_history).permit(:source_currency, :source_currency_value, :converted_curreny)
  end

  def set_currency_converion_history
    @currency_conversion_history = CurrencyConversionHistory.find(params[:id])
  end
end
