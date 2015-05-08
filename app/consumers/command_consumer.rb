class CommandConsumer
  include Beaglebone
  include Emque::Consuming.consumer

  def process_command(message)
    GPIOPin
      .new(*message.values[:init_args])
      .send(message.values[:command], *message.values[:command_args])
  end
end
