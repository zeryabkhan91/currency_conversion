class CreateCurrencyConversionHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :currency_conversion_histories do |t|
      t.string :source_currency
      t.string :converted_curreny
      t.float :source_currency_value
      t.float :converted_currency_value

      t.timestamps
    end
  end
end
