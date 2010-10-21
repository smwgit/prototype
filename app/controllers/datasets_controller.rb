class DatasetsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    @dataset = current_user.datasets.build(params[:dataset])
    if @dataset.save
      flash[:success] = "Dataset created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @dataset.destroy
    redirect_back_or root_path
  end
  
  private

    def authorized_user
      @dataset = Dataset.find(params[:id])
      redirect_to root_path unless current_user?(@dataset.user)
    end
end