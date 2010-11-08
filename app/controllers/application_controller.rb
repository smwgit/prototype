class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  helper_method :sort_column, :sort_direction, :toggle_state
  
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