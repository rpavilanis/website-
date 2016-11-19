class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @projects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 9)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Ohh yeah...good job finishing a project and projecting it."
    else
      render 'new', notice: "Oh, no, I was unable to save this project."
    end
  end

  def edit
  end

  def show
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Your project was successfully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end


private

  def project_params
    params.require(:project).permit(:title, :description, :link, :slug, :picture)
  end

  def find_project
    @project = Project.friendly.find(params[:id])
  end

end
