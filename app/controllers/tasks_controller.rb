class TasksController < ApplicationController
  # descomenta before_action, not_repeat_code e apaga manualmente cada codigo repetido dos metodos no colchetes abaixo
  # before_action :not_repeat_code, only: %i[show edit update destroy]

  def index
    @tasks = Task.all # pega todos os tasks do DB
  end

  def new
    @task = Task.new # instancia um novo task
  end

  def show
    @task = Task.find(params[:id]) # vindo do browser
  end

  def create
    @task = Task.new(task_params) # instancia com as caracteristicas permitidas
    @task.save # para persistir os dados no banco de dados
    redirect_to tasks_path(@task) # é opcional colocar o @task dentro do parenteses, pega pela id;
  end

  def edit
    @task = Task.find(params[:id])
    # redirect_to task_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  # faz isso para permitir criar com essas caracteristicas
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # def not_repeat_code
  #   @task = Task.find(params[:id])
  # end
end
