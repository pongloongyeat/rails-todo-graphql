module Mutations
  class DeleteTodo < BaseMutation
    argument :id, ID, required: true

    type Types::TodoType

    def resolve(id:)
      Todo.find(id).destroy
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Todo does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
