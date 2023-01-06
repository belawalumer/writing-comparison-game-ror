class ScriptsController < ApplicationController

  def home 
  end

  def index
    @scripts = Script.all
  end

  def show
    @script = Script.find(params[:id])
  end

  def new
    @script = Script.new
  end

  def create
    user = create_user_for_essay(params[:script][:virtual_user])

    @script = Script.new(script_params)
    @script.user = user
    

    if @script.save
      default_point_for_essay(@script)
      redirect_to @script
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @script = Script.find(params[:id])
  end

  def update
    @script = Script.find(params[:id])

    if @script.update(script_params)
      redirect_to @script
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @script = Script.find(params[:id])
    @script.destroy

    redirect_to scripts_path, status: :see_other
  end

  private
    def script_params
      params.require(:script).permit(:script_type, :content)
    end

    def create_user_for_essay(name)
      User.create!(name: name)
    end

    def default_point_for_essay(script)
      Point.create(value: Script::DEFAULT_VALUE, 
        user_id: script&.user&.id, 
        script_id: script&.id)
    end
end
