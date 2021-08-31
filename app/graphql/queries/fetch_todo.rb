module Queries
  class FetchTodo < Queries::BaseQuery

    type Types::TodoType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Todo.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Todo does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
