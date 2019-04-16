class AuthorizedClientsController < ApplicationController
  require 'json'
  before_action :authenticate_user!
  before_action :set_authorized_client, only: [:show, :edit, :update, :destroy, :set_cookie_client_secret]
  # after_action :after_save, only: [:update, :create]
  # GET /authorized_clients
  # GET /authorized_clients.json
  def index
    @authorized_clients = AuthorizedClient.all
  end

  # GET /authorized_clients/1
  # GET /authorized_clients/1.json
  def show
  end

  # GET /authorized_clients/new
  def new
    @authorized_client = AuthorizedClient.new
    @authorized_client.client_secret = AuthorizedClient.generate_client_secret
  end

  # GET /authorized_clients/1/edit
  def edit
  end

  # POST /authorized_clients
  # POST /authorized_clients.json
  def create
    @authorized_client = AuthorizedClient.new(authorized_client_params)

    respond_to do |format|
      if @authorized_client.save
        format.html {redirect_to @authorized_client, notice: 'Authorized client was successfully created.'}
        format.json {render :show, status: :created, location: @authorized_client}
      else
        format.html {render :new}
        format.json {render json: @authorized_client.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /authorized_clients/1
  # PATCH/PUT /authorized_clients/1.json
  def update
    respond_to do |format|
      if @authorized_client.update(authorized_client_params)
        format.html {redirect_to @authorized_client, notice: 'Authorized client was successfully updated.'}
        format.json {render :show, status: :ok, location: @authorized_client}
      else
        format.html {render :edit}
        format.json {render json: @authorized_client.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /authorized_clients/1
  # DELETE /authorized_clients/1.json
  def destroy
    @authorized_client.destroy
    respond_to do |format|
      format.html {redirect_to authorized_clients_url, notice: 'Authorized client was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def set_cookie_client_secret
    cookies.permanent[:client_secret] = @authorized_client.client_secret
    flash[:notice] = 'Set cookie successfully'
    # render :nothing => true
    # redirect_to authorized_clients_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_authorized_client
    @authorized_client = AuthorizedClient.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def authorized_client_params
    params.require(:authorized_client).permit(:client_name, :client_secret, :location)
  end

end
