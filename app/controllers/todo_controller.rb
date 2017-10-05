class TodoController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end
end
