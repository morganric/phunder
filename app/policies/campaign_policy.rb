class CampaignPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @campaign = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def edit?
    @current_user.admin? || @current_user == @campaign.user
    # @user.admin? || @record.user_id == @user.id
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

end
