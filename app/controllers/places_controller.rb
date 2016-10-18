class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.paginate(:page => params[:page], :per_page => 2).order('name ASC')
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      render file: Rails.root.join('public','403_forbidden.html'), status: :not_found, layout: false
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'Update Forbidden', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      return render text: 'Update Forbidden', status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'Destroy Forbidden', status: :unprocessable_entity
    end
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.required(:place).permit(:name, :address, :description)
  end

end
