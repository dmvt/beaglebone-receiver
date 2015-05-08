Receiver::Application.router.map do
  topic "commands" => CommandConsumer do
    map "gpio.command" => "process_command"
  end
end
