class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all

  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_url
    else
      render  :action => :new
    end
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_url
    else
      render  :action => :edit
    end
  end

  def destroy
    if Time.parse(@todo.due_date.to_s).to_i < Time.now.to_i
    flash[:alert] = "已超過截止時間，無法刪除待辦事項"
    else
      @todo.destroy
    end

    redirect_to todos_url
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :desc, :finished)
  end


end
