class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @groups = []
    Group.all.each do |group|
      @groups.push([group.name, group.id])
    end
  end

  def create; end
    @entity = Entity.new(entity_params)
    group = Group.find_by(id: params[:entity][:group])
    @entity.groups.push(group)
    @entity.user = current_user
    @group.entities.push(@entity)
    if @entity.saved
        flash[:success] = 'The entity has been created successfully!'
        redirect_to home_page_path
    else
        flash[:error] = 'Error: The entity has not been created!'
        render :new
    end
    
  private

  def entity_params
    params.require(:entity).permit(:name, :amount,:group)
  end
end
