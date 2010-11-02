class DatasetsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  helper_method :sort_column, :sort_direction

  def create
    @dataset = datasets.build(params[:dataset])
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
  
  def show
    @dataset = Dataset.find(params[:id])
    @title = @dataset.id
    @showAll = true;
  end
  
  def edit
    @title = "Edit dataset"
  end
  
  def index
    @title = "All datasets"
    #@datasets = Dataset.paginate(:page => params[:page])
    @datasets = Dataset.order(sort_column + " " + sort_direction)
    @showAll = false;
  end
  
  private

    def authorized_user
      #@dataset = Dataset.find(params[:id])
      @datasets = Dataset.order(sort_column + " " + sort_direction)
      redirect_to root_path unless current_user?(@dataset.user)
    end
    
    def sort_column
      Dataset.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end