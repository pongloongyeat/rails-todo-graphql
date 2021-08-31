module Mutations
  class CreateTodo < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :is_done, Boolean, required: false
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: false

    type Types::TodoType

    def resolve(title: nil, description: '', is_done: false, due_date: nil)
      Todo.create!(
        title: title,
        description: description,
        is_done: is_done,
        due_date: due_date,
      )
    end
  end
end
