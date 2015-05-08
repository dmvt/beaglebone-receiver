class CommandConsumer
  include Beaglebone
  include Emque::Consuming.consumer

  def process_command(message)
    GPIOPin
      .new(*message.values[:init_args].map(&:to_sym))
      .send(
        message.values[:command],
        *message.values[:command_args].map(&:to_sym)
      )
  end
end
