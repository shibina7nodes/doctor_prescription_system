class BookingsController < ApplicationController
	def new
		@book = Booking.new
    @doctor = Doctor.all
    @patient = Patient.all
	end
  
  def create
		@book = Booking.new(booking_params)
  
		if @book.save
			flash[:success] = "Added successfully"
    	redirect_to new_booking_path
  	end
  end

  	def index
  	 	@book = Booking.all 
  	end
  	
  	def edit 
  	@book = Booking.find(params[:id])
    @doctor = Doctor.all
    @patient = Patient.all
	end

	def update
		respond_to do |format|
      @book = Booking.find(params[:id])
    		if @book.update(booking_params)
        	format.html { redirect_to bookings_path, notice: 'booking was successfully updated.' }
        	format.json { render :show, status: :ok, location: @book }
     		else
        	format.html { render :edit }
         	format.json { render json: @book.errors, status: :unprocessable_entity }
      	end
    end
	end
  	
  def destroy
    @book = Booking.find(params[:id])
    @book.destroy
    redirect_to bookings_path
  end 

  def patients_notification
    # @booked_patients = Booking.all
    # @patient = Patient.all 
    # @doctor = Doctor.all 
     d = Doctor.find_by_email(current_user.email)
     @list = Booking.where("created_at >= ?", Date.today).where(["doctor_id = ?", d.id])

  end
	
	def booking_params
    params.require(:booking).permit(:patient_id, :doctor_id, :b_date)
  end
end
