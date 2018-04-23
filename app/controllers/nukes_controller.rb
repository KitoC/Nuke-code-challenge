class NukesController < ApplicationController
  before_action :set_nuke, only: [:show, :edit, :update, :destroy, :index]

  # GET /nukes
  # GET /nukes.json
  def index
  end

  # GET /nukes/1
  # GET /nukes/1.json
  def show
     time = Time.now.strftime('%I'+'%M').to_i - Nuke.first.updated_at.strftime('%I'+'%M').to_i

   if time >= 1 or time <= -1
     @nuke.nuke_update
   end

    @nuke_first = ' '
    @nuke_last = ' '
   if current_user.president?
      @nuke_first = Nuke.first.nuke_code_first
   elsif current_user.defence_secretary?
      @nuke_last = Nuke.first.nuke_code_last
   elsif current_user.russian?
      @nuke_first = Nuke.first.nuke_code_first
      @nuke_last = Nuke.first.nuke_code_last
   end

  end

  # GET /nukes/new
  def new
    @nuke = Nuke.new
  end

  # GET /nukes/1/edit
  def edit
  end

  # POST /nukes
  # POST /nukes.json
  def create
    @nuke = Nuke.new(nuke_params)

    respond_to do |format|
      if @nuke.save
        format.html { redirect_to @nuke, notice: 'Nuke was successfully created.' }
        format.json { render :show, status: :created, location: @nuke }
      else
        format.html { render :new }
        format.json { render json: @nuke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nukes/1
  # PATCH/PUT /nukes/1.json
  def update
    respond_to do |format|
      if @nuke.update(nuke_params)
        format.html { redirect_to @nuke, notice: 'Nuke was successfully updated.' }
        format.json { render :show, status: :ok, location: @nuke }
      else
        format.html { render :edit }
        format.json { render json: @nuke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nukes/1
  # DELETE /nukes/1.json
  def destroy
    @nuke.destroy
    respond_to do |format|
      format.html { redirect_to nukes_url, notice: 'Nuke was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nuke
      @nuke = Nuke.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nuke_params
      params.require(:nuke).permit(:nuke_code)
    end



end
