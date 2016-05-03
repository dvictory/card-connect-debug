CardConnect::Client.class_eval do

  # @param command [Symbol] the "symbolized" name of the {Command} class, i.e. :Authorization
  # @param data [Hash] the data necessary to create the request represented by +command+
  # @return [CardConnect::Response]
  def perform_service_request(command:, data:)
    puts "Debug Perform Service"
    data.merge!(merchid: merchid)

    command_klass = CardConnect::Command.const_get(command)
    auth_command  = command_klass.new(data)
    raise_test_error?(auth_command) if test_mode
    puts auth_command.to_json
    http_response = connection.put do |req|
      req.url  (cc_url + command_klass.const_get("ENDPOINT_FRAGMENT"))
      req.body = auth_command.to_json
    end
    puts http_response.body
    CardConnect::Response.new(http_response: http_response, transaction_type: command_klass)
  end

  def raise_test_error?(command)
    case command.amount
    when "5.21", "7.5"
      raise Faraday::Error::ConnectionFailed, "Simulated Connection Failure"
    when "5.22", "7.83"
      raise Faraday::Error::TimeoutError
    else
      return
    end
  end
end