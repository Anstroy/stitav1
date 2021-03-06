class EducationsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  before_action :set_education, only: [:edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  #def index
  #  @educations = Education.all
  #end

  # GET /educations/1
  # GET /educations/1.json
  #def show
  #end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(education_params)
    @member = Member.find_by(id: @education.member_id)
    respond_to do |format|
      if @education.save
        format.html { redirect_to edit_member_url(@member, :anchor => "education"), notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: edit_member_url(@member)}
      else
        format.html { render :new }
        format.json { render json: edit_member_url(@member).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    @member = Member.find_by(id: @education.member_id)
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to edit_member_url(@member, :anchor => "education"), notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @member = Member.find_by(id: @education.member_id)
    @education.destroy
    respond_to do |format|
      format.html { redirect_to edit_member_url(@member, :anchor => "education"), notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:school, :degree, :info, :start, :end, :member_id)
    end
end
