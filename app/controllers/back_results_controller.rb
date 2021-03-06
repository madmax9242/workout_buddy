class BackResultsController < ApplicationController
	def index
    	@back_results = Back_Result.all
      respond_to do |format|
        format.html
        format.json { render :json => @back_results.to_json }
      end
  	end


  	def show
      @back_results = Back_Result.all
      respond_to do |format|
        format.html
        format.json { render :json => @back_results.to_json }
      end
  	end

  	def create
      @back_result = Back_Result.new(back_params)
      @back_result.user_id = current_user.id

      respond_to do |format|
        if @back_result.save
          format.html { redirect_to :users, notice: 'Workout was successfully logged.' }
          format.json { render :show, status: :created, location: @back_result }
        else
          format.html { render :new }
        end
      end
    end

  def new
		@back_result = Back_Result.new
	end

	private
		def back_params
	      params.require(:back_result).permit(:seated_row,:lat_pulldown,:renegade_row,:good_mornings,:deadlift,:deltoid_fly)
	  end
end