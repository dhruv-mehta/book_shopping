class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new

  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
  admin = Admin.find_by(:name => params[:name])
  if admin && admin.authenticate(params[:password])

    session[:user_id] = admin.id
    respond_to do |format|
      if admin.is_admin?
         format.html { redirect_to admin_root_path } #, flash[:success] = "holder updated")
         format.js
      else
         format.html { redirect_to root_path } #, flash[:success] = "holder updated")
         format.js
      end
    end
  else
  
    redirect_to new_session_path, alert: "Invalid user/password combination"
  end
end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :new , notice: 'you have entered the wrong password.....' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
  session[:user_id]=nil
    
    session[:cart_id] = nil
  redirect_to root_path,  alert: "successfully logout"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.fetch(:session, {})
    end
end
