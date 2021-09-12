class FileRecordsController < ApplicationController
  before_action :set_file_record, only: %i[ show edit update destroy inci_score ]

  # GET /file_records or /file_records.json
  def index
    @file_records = FileRecord.all
  end

  # GET /file_records/1 or /file_records/1.json
  def show
  end

  # GET /file_records/new
  def new
    @file_record = FileRecord.new
  end

  # GET /file_records/1/edit
  def edit
  end

  # POST /file_records or /file_records.json
  def create
    @file_record = FileRecord.new(file_record_params)
    @file_record.user_id = current_user.id

    respond_to do |format|
      if @file_record.save
        format.html { redirect_to file_records_path, notice: "File record was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_records/1 or /file_records/1.json
  def update
    respond_to do |format|
      if @file_record.update(file_record_params)
        format.html { redirect_to @file_record, notice: "File record was successfully updated." }
        format.json { render :show, status: :ok, location: @file_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_records/1 or /file_records/1.json
  def destroy
    @file_record.destroy
    respond_to do |format|
      format.html { redirect_to file_records_url, notice: "File record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def inci_score
    unless @file_record.inci_records.present?
      require 'roo'
      require "inci_score"
      index=0
      $i=2
      excel = Roo::Spreadsheet.open(@file_record.file.path)
      sheets = excel.sheets
      sheets.each do |sheet|
        while $i < excel.sheet(sheet).last_row  do
          composition = excel.sheet(sheet).row($i)
          inci = InciScore::Computer.new(src: composition[2]).call
          score = inci.score
          unrecognized = inci.unrecognized

          InciRecord.create(product:composition[0],score:score,composition:composition[2],unrecognized_inci:unrecognized,reference:composition[1],file_record_id:@file_record.id)

          puts("Inside the loop i = #$i" )
          $i +=1
        end
      end
    end
    @inci_records = @file_record.inci_records
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_record
      @file_record = FileRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_record_params
      params.require(:file_record).permit(:name, :file)
    end
end
