class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(places_path)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :username, :avatar, :avatar_cache, :bio])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :bio])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ || params[:controller] == "payments"
  end
end
