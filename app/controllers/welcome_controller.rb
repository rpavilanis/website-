class WelcomeController < ApplicationController
  def index
    @posts = Post.all.limit(3).order("created_at desc")

    @projects = Project.all.limit(3).order("created_at desc")
  end

  def show
      if valid_page?
        render template: "welcome/#{params[:page]}"
      else
        render file: "public/404.html", status: :not_found
      end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/welcome/#{params[:page]}.html.erb"))
  end
end
