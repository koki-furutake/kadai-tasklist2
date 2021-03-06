class TasklistsController < ApplicationController
  before_action :set_tasklist,only:[:show,:edit,:update,:destroy]
  def index
    @tasklist = Tasklist.all.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(task_params)
    
    if @tasklist.save
      flash[:success]="タスクが正常に追加されました。"
      redirect_to @tasklist
    else 
      flash.now[:danger]="タスクが追加されませんでした。"
      render :new
    end
  end

  def edit
  end

  def update

    if @tasklist.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end

  end

  def destroy
    @tasklist.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasklists_url
  end
end

private
def set_tasklist
  @tasklist = Tasklist.find(params[:id])
end

def task_params
  params.require(:tasklist).permit(:content,:status)
end
