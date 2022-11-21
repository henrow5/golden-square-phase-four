require "twilio-ruby"

class Sms
  def initialize(client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TKN"]))
    @client = client
    @from = ENV["TWILIO_NUMBER"]
    @to = ENV["CUSTOMER_NUMBER"]
    @delivery_time = (Time.now + 3600).strftime("%H:%M")
  end

  def send(time = @delivery_time, number = @to)
    @client.messages.create(
      from: @from,
      to: number,
      body: "Thank you! Your order was placed and will be delivered before #{time}.",
    )
  end
end
