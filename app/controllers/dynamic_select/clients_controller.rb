module DynamicSelect
  class ClientsController < ApplicationController
    respond_to :json

    def trackings
      @projects = Project.where(:client_id => params[:client_id])
      @trackings = Tracking.where(:project_id => @projects.collect { |p| p.id }).select('id, description')
      respond_with(@trackings)
    end
  end
end
