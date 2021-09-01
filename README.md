# Todo GraphQL API

A simple Todo backend with queries and mutations for fetching, creating, updating and deleting Todos.

## Setting up

```bash
# Set your ruby version to 3.0.1
rbenv install 3.0.1
rbenv global 3.0.1

# Clone this repo
git clone https://github.com/pongloongyeat/rails-todo-graphql.git && cd rails-todo-graphql

# Install gems and make migrations
bundle install
rails db:create
rails db:migrate
rails db:seed

# Run server
bundle exec rails server
```

Have fun with the APIs on [localhost:3000/graphiql](http://localhost:3000/graphiql).

## Playing with the APIs

Copy and paste the following into GraphiQL:

```
query fetchTodos {
  fetchTodos {
    id
    title
    description
    isDone
    dueDate
  }
}

query fetchSpecificTodo {
  fetchTodo(id: 8) {
		id
    title
    description
    isDone
    dueDate
  }
}

mutation createTodo {
 	createTodo(title: "GraphQL notes", description: "A long body of text about GraphQL", isDone: true) {
   	id
   	title
   	description
    isDone
		dueDate
	}
}

mutation updateTodo {
  updateTodo(id: 8, title: "Updated title", isDone:false) {
    id
    title
    description
    isDone
    dueDate
  }
}

mutation deleteTodo {
  deleteTodo(id: 8) {
		id
    title
    description
    isDone
    dueDate
  }
}
```
