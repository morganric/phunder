class CampaignPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def admin?
    @user.admin?
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def edit?
    @user.admin? || @record.user_id == @user.id
  end

  # def update?
  #   @user.admin? || @record.user_id == @user.id
  # end

  def destroy?
    @user.admin?
  end

end
