class RedmineSprintsSettingsController < SettingsController
  unloadable

  def index
    @user_stories_statuses = UserStoriesStatus.find(:all, :order => "position" )
  end

  def new
  end

  def create
    if request.post?
      @user_stories_status = UserStoriesStatus.new
      @user_stories_status.attributes = params[:user_stories_status]
      if @user_stories_status.save
        flash[:notice] = l(:user_stories_status_created)
        redirect_to :action => 'index'
      else
        render :action => 'new'
      end
    end
  end

  def destroy
    if UserStoriesStatus.destroy(params[:status_to_delete_id])
      flash[:notice] = l(:user_stories_status_deleted)
    else
      flash[:error] = l(:can_not_delete_user_story_status)
    end
    @user_stories_statuses = UserStoriesStatus.find(:all, :order => "position" )
    render 'index'
  end

  def update
    user_status_to_update = UserStoriesStatus.find(params[:status_to_update_id])
    if user_status_to_update.update_attributes(params[:user_story_status])
      flash[:notice] = l(:user_stories_status_updated)
    else
      flash[:error] = l(:user_stories_status_cant_be_updated)
    end
    @user_stories_statuses = UserStoriesStatus.find(:all)
    redirect_to :action => 'index'
  end
end
