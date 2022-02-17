class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = Group.all.includes(:user)
  end

  def new
    @group = Group.new
    # @group.user = current_user
  end

  def show
    @group = Group.find_by(id: params[:id])
    @sum = 0
    @entities = @group.entities.order(created_at: :desc)
    @entities.each do |entity|
      @sum += entity.amount
    end
  end

  def create
    @group = Group.new(group_params)
    @group.icon = upload
    @group.user = current_user
    if @group.save
      flash[:success] = 'the group havs been saved successfully!'
      redirect_to groups_path
    else
      flash.now[:error] = 'couldn\'t save the group!'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def upload
    uploaded_file = params[:group][:icon]
    dir_upload = 'uploads'
    ext = uploaded_file.original_filename.split('.')
    ext = ext[ext.length - 1]
    new_name = Time.now.to_i.to_s
    new_name.concat('.')
    new_name.concat(ext.to_s)
    unless File.exist?(File.dirname(Rails.root.join('public', dir_upload, new_name)))
      FileUtils.mkdir_p(File.dirname(Rails.root.join('public', dir_upload, new_name)))
    end

    File.open(Rails.root.join('public', 'uploads', new_name), 'wb') do |file|
      file.write(uploaded_file.read)
    end
    new_name
  end
end
