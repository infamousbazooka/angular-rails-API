class TodoController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.create(:title => params[:title], :status => false)
    @todos = Todo.all
    render json: @todos
  end

  def update
    @todo = Todo.find_by(:id => params[:id])
    @todo.status = !@todo.status
    @todo.save
    @todos = Todo.all
    render json: @todos
  end

  def destroy
    @todo = Todo.find_by(:id => params[:id])
    if !@todo
      output = {'status' => 'not found'}.to_json
      render :json => output
      return
    end
    @todo.destroy
    @todos = Todo.all
    render json: @todos
  end
end
