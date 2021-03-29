class MessageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :text, :created_at
  belongs_to :user, serializer: UserSerializer
end
