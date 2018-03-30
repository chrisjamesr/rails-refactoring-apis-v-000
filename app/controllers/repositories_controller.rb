class RepositoriesController < ApplicationController
  def index
    @service = GithubService.new({"access_token" => session[:token]})
  end

  def create
    GithubService.new({"access_token" => session[:token]}).create_repo(params[:name])   
    redirect_to '/'
  end
end
