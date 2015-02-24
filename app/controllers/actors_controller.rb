class ActorsController < ApplicationController
  before_action :set_actor, only: [:edit, :show, :update, :destroy]

  def index
    @actors = Actor.all
  end

  def create
    form_data = params.require(:actor).permit(:name)
    Actor.create form_data
    redirect_to actors_path
  end

  def new
    @actor = Actor.new
  end

  def edit
  end

  def show
  end

  def update
    @actor.update_attributes actor_params
    redirect_to actor_path(@actor)
  end

  def destroy
    @actor.destroy
    redirect_to actors_path
  end

  private
    
    # Setting actor instance
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Defining allowed params
    def actor_params
      params.require(:actor).permit(:name)
    end

end
