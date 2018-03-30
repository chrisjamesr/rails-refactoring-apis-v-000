class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @service = GithubService.new
    # @service.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_CLIENT'], params[:code])
    session[:token] = @service.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    session[:username] = @service.get_username
    redirect_to root_path
  end

end