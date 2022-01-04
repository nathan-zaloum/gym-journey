class JournalsController < ApplicationController
  before_action :set_journal, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]

  # GET /journals or /journals.json
  def index
    @journals = Journal.all
  end

  # GET /journals/1 or /journals/1.json
  def show
  end

  # GET /journals/new
  def new
    # @journal = Journal.new
    @journal = current_user.journal.build
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals or /journals.json
  def create
    # @journal = Journal.new(journal_params)
    @journal = current_user.journal.build(journal_params)

    respond_to do |format|
      if @journal.save
        format.html { redirect_to journal_url(@journal), notice: "Journal was successfully created." }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1 or /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to journal_url(@journal), notice: "Journal was successfully updated." }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1 or /journals/1.json
  def destroy
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to journals_url, notice: "Journal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @journal = current_user.journal.find_by(id: params[:id])
    redirect_to journal_path, notice: "Not Authorized To Edit This Journal" if @journal.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def journal_params
      params.require(:journal).permit(:date, :weight, :entry, :gym_attendance, :water, :calories, :user_id)
    end
end
