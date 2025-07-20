class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def about; end

  def contact; end

  def signup
    redirect_to new_user_path
  end

  def hello_custom
    @your_name = "Quỳnh Như"
  end
end
