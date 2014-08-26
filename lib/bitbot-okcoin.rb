require 'bitbot'
require 'json'
require 'net/http'

module BitBot
  module OKCoin

    def ticker
      uri = URI('https://www.okcoin.cn/api/ticker.do')
      body = Net::HTTP.get_response(uri, nil, 443).body
      resp = JSON.parse body
      check_response(resp)

      original = resp['ticker']
      map  = {sell: :ask, buy: :bid}

      Ticker.new rekey(original, map).merge(original: original, agent: self)
    end

    def offers
      uri = URI('https://www.okcoin.cn/api/depth.do')
      body = Net::HTTP.get_response(uri, nil, 443).body
      resp = JSON.parse body

      check_response(resp)

      asks = resp['asks'].reverse.collect do |arr|
        Offer.new price: arr[0], amount: arr[1], original: arr, agent: self
      end

      bids = resp['bids'].collect do |arr|
        Offer.new price: arr[0], amount: arr[1], original: arr, agent: self
      end

      {asks: asks, bids: bids}
    end

    private

    def check_response(response)
    end

  end
end

BitBot.define :okcoin, BitBot::OKCoin
