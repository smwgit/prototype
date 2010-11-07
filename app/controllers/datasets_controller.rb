class DatasetsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction, :toggle_state

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
    Dataset.find(params[:id]).destroy
    flash[:success] = "Dataset deleted."
    redirect_to :back
  end
  
  def show
    @dataset = Dataset.find(params[:id])
    @title = @dataset.id
    @showAll = toggle_state;
  end
  
  def edit
    @dataset = Dataset.find(params[:id])
    @title = "Edit dataset"
  end
  
  def index
    @title = "All datasets"
    #@datasets = Dataset.paginate(:page => params[:page])
    @datasets = Dataset.paginate(order(sort_column + " " + sort_direction))
    @showAll = toggle_state;
  end
  
  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update_attributes(params[:dataset])
      flash[:success] = "Dataset updated!"
      redirect_to @dataset
    else
      @title = "Edit dataset"
      render 'edit'
    end
  end
  
  private

    def authorized_user
      @dataset = Dataset.find(params[:id])
      redirect_to dataset_path unless current_user?(@dataset.user)
    end
    
    def sort_column
      Dataset.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    def toggle_state
      %w[yes no].include?(params[:showAll]) ? params[:showAll] : "no"
    end
end