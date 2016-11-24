class KaraokesController < ApplicationController

  def index
  end

  def show
    @karaoke = Karaoke.find(params[:id])
  end

  def new
    @karaoke = Karaoke.new
  end

  def create
    @karaoke = Karaoke.new(karaoke_params)

    if @karaoke.save
      # Handle a successful save
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # Extra level of indentation to make it obvious what is private
  private

    def karaoke_params
      params.require(:karaoke).permit(:name, :drink_price, :day, :day_price, :day_price_weekend,
                                      :day_price_freetime, :day_price_freetime_weekend, :night, 
                                      :night_price, :night_price_weekend, :night_price_freetime,
                                      :night_price_freetime_weekend, :conditions)
    end

end
