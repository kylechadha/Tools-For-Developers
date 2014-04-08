class ToolsController < ApplicationController

  before_action :login_required, except: [:index, :show]

  def index
    @tools = Tool.all

    # Exploring custom parameters -- not used in final revision
    if params[:show] == "all"
      @tools = Tool.all
    elsif params[:show] == "page1"
      @tools = Tool.all[0..7]
    elsif params[:show] == "page2"
      @tools = Tool.all[8..15]
    end

    @show = params[:show]
  end

  def list
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params.merge(user_id: current_user.id))
    
    if @tool.save
      redirect_to action: 'index'
      flash[:notice] = "Successfully submitted resource!"
    else
      render action: 'new'
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])

    if @tool.update(tool_params)
      redirect_to action: 'index'
      flash[:notice] = 'Resource successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to action: 'index'
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :desc, :url, :screenshot, :app_type_id, category_ids: [])
  end

end
