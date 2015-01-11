module ExchangeRate
  extend ActiveSupport::Concern

  def get_privat_rates(currency)
    begin
    source='https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11'
    resp = Net::HTTP.get_response(URI.parse(source))
    result = JSON.parse(resp.body)
    result.map{|r| r if r['ccy'] == currency}.compact[0]['buy'].to_f
    rescue
      1
    end

  end
end