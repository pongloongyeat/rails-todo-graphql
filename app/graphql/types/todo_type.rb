module Types
  class TodoType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :is_done, Boolean, null: false
    field :due_date, GraphQL::Types::ISO8601DateTime, null: true
  end
end
