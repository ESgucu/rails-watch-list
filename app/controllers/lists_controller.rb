class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(params_list)
    if @list.save!
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end
  private

  def params_list
    params.require(:list).permit(:name)
  end

end
