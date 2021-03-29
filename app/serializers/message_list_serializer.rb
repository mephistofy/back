class MessageListSerializer
  include FastJsonapi::ObjectSerializer
  #attributes 
  attr_reader :messages

  def initialize arg
    @messages = arg[:messages]
  end

  def generate
    {
      current_page: messages.current_page,
      count: messages.size,
      total_pages: messages.total_pages,
      total_count: messages.total_count,
      messages: FastJsonapi::ObjectSerializer
        .new(messages, each_serializer: MessageSerializer)
    }
  end
end
