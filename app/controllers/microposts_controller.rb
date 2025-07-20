class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all # Fetch all microposts
  end
end
