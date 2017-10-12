class TodoController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.status = false
    if @todo.save
      render json: @todo
    else
      return 0
    end
  end

  def update
    @todo = Todo.find_by(:id => params[:id])
    if !@todo
      output = {'status' => 'not found'}.to_json
      render :json => output
      return
    end
    @todo.status = !@todo.status
    if @todo.save
      render json: @todo
    else
      return 0
    end
  end

  def destroy
    @todo = Todo.find_by(:id => params[:id])
    if !@todo
      output = {'status' => 'not found'}.to_json
      render :json => output
      return
    end
    if @todo.destroy
      render json: @todo
    else
      return 0
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:title)
    end
end
