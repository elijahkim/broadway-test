defmodule MyConsumer do
  use Broadway

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producers: [
        sqs: [
          module: {BroadwaySQS.Producer, queue_name: "test_queue"}]
      ],
      processors: [
        default: [stages: 50]
      ]
    )
  end

  def handle_message(_processor_name, message, _context) do
    IO.inspect(message.data)

    message
  end
end
