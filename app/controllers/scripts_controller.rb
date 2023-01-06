class ScriptsController < ApplicationController

  before_action :set_user, only: %i[create]

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
    @script = Script.new(script_params)
    @script.user = @user


    if @script.save
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

    def set_user
      @user = User.create!(name: params[:script][:virtual_user])
    end
end
