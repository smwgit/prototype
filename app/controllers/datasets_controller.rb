class DatasetsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]

  def create
    @dataset = current_user.datasets.build(params[:dataset])
    if @dataset.save
      flash[:success] = "Dataset created!"
      redirect_to datasets_path
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
  
  def index
    @title = "All datasets"
    #@datasets = Dataset.paginate(:page => params[:page])
    @datasets = Dataset.order(sort_column + " " + sort_direction).search(params[:search])
    @showAll = toggle_state;
  end
  
  def edit
    @dataset = Dataset.find(params[:id])
    @title = "Edit dataset"
  end
  
  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update_attributes(params[:dataset])
      flash[:success] = "Dataset updated!"
      redirect_to datasets_path
    else
      @title = "Edit dataset"
      render 'edit'
    end
  end
  
  def duplicate
    @dataset = Dataset.find(params[:id])
    @newdataset = Dataset.new(@dataset.attributes)  
    @newdataset.jobid = @newdataset.jobid + " copy"
    @newdataset.save
    if @newdataset.save
        #redirect_to :action => 'list'
      flash[:success] = "Dataset duplicated!"
      redirect_to edit_dataset_path(@newdataset)
    end
  end
  
  private

    def authorized_user
      @dataset = Dataset.find(params[:id])
      redirect_to dataset_path unless current_user?(@dataset.user)
    end

end