module SessionHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      if User.find_by(id: session[:user_id]).nil?
        #刪除使用者導致session[:user_id]還是存在時
        session[:user_id] = nil
        @current_user = nil
      else
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
  end

  def current_user?
    params_user = request.path.split("/")[2].to_i
    redirect_to user_missions_path(current_user), notice: I18n.t("message.not_self")  if params_user != current_user.id
  end

  def user_sign_in?
    redirect_to user_missions_path(current_user) if current_user
  end

  def authenticate_user!
    redirect_to root_path, notice: I18n.t("notice.login_first") if current_user.blank? 
    current_user?
  end
end
