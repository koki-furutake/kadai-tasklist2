class TasklistsController < ApplicationController
  def index
    @tasklist = Tasklist.all
  end

  def show
    @tasklist = Tasklist.find(params[:id])
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
    @tasklist = Tasklist.find(params[:id])
  end

  def update
        @tasklist = Tasklist.find(params[:id])

    if @tasklist.update(tasklist_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end

  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasklists_url
  end
end

private
def task_params
  params.require(:tasklist).permit(:content)
end
