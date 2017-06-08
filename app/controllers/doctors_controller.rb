class DoctorsController < ApplicationController
	def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      DoctorNotifierMailer.send_signup_email(@doctor).deliver
      flash[:notice] = "Added successfully"
      redirect_to new_doctor_path
    end
  end

  def index
    @doctor = Doctor.all 
  end

  def edit 
    @doctor = Doctor.find(params[:id])
  end

  def update
    respond_to do |format|
      @doctor = Doctor.find(params[:id])
        if @doctor.update(doctor_params)
          format.html { redirect_to doctors_path, notice: 'Doctor was successfully updated.' }
          format.json { render :show, status: :ok, location: @doctor }
        else
          format.html { render :edit }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
      redirect_to doctors_path
  end 

   

  def doctor_params
    params.require(:doctor).permit(:d_name, :d_gender, :d_address, :d_mobno, :d_specialize, :email)
  end

end
