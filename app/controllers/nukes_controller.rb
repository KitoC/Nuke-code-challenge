class NukesController < ApplicationController
  before_action :set_nuke, only: [:show, :edit, :update, :destroy, :index]
  before_action :check_role, only: [:show]
  # GET /nukes
  # GET /nukes.json
  def index
  end

  # GET /nukes/1
  # GET /nukes/1.json

  def show
    time = Time.now.strftime('%I'+'%M').to_i - @nuke.update_codes.to_i

   if time >= 5 or time <= -1
     @nuke.nuke_update
   end

   if time <= 5 or time >= -5
     codes_viewed
   end

   if current_user == User.first
     @nuke.nuke_president
   elsif current_user == User.find(2)
     @nuke.nuke_secretary
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

    def set_time
      time = Time.now.strftime('%I'+'%M').to_i - Nuke.first.updated_at.strftime('%I'+'%M').to_i
      return time
    end

    def last_signin
      president_last = Time.now.strftime('%I'+'%M').to_i - User.first.last_sign_in_at.strftime('%I'+'%M').to_i

      secretary_last = Time.now.strftime('%I'+'%M').to_i - User.find(2).last_sign_in_at.strftime('%I'+'%M').to_i
    end

    def check_role
      UserNotifierMailer.notify_president.deliver if current_user.russian?
    end

    def codes_viewed
      pres_time = Time.now.strftime('%I'+'%M').to_i - @nuke.president.to_i
      sec_time = Time.now.strftime('%I'+'%M').to_i - @nuke.president.to_i

      if (pres_time <= 5 or pres_time >= 5) && (sec_time <= 5 or sec_time >= 5)
      UserNotifierMailer.notify_russians('President and the defence secretary').deliver
      end
    end



end
