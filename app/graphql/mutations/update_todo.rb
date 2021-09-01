module Mutations
  class UpdateTodo < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :is_done, Boolean, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false

    type Types::TodoType

    def resolve(id:, **attributes)
      Todo.find(id).tap do |todo|
        todo.update(attributes)
      end

      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Todo does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
