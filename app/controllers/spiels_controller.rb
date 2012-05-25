class SpielsController < ApplicationController
  # GET /spiels
  # GET /spiels.json
  def index
    @spiels = Spiel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spiels }
    end
  end

  # GET /spiels/1
  # GET /spiels/1.json
  def show
    @spiel = Spiel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spiel }
    end
  end

  # GET /spiels/new
  # GET /spiels/new.json
  def new
    @spiel = Spiel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spiel }
    end
  end

  # GET /spiels/1/edit
  def edit
    @spiel = Spiel.find(params[:id])
  end

  # POST /spiels
  # POST /spiels.json
  def create
    @spiel = Spiel.new(params[:spiel])

    respond_to do |format|
      if @spiel.save
        format.html { redirect_to @spiel, notice: 'Spiel was successfully created.' }
        format.json { render json: @spiel, status: :created, location: @spiel }
      else
        format.html { render action: "new" }
        format.json { render json: @spiel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spiels/1
  # PUT /spiels/1.json
  def update
    @spiel = Spiel.find(params[:id])

    respond_to do |format|
      if @spiel.update_attributes(params[:spiel])
        format.html { redirect_to @spiel, notice: 'Spiel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spiel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spiels/1
  # DELETE /spiels/1.json
  def destroy
    @spiel = Spiel.find(params[:id])
    @spiel.destroy

    respond_to do |format|
      format.html { redirect_to spiels_url }
      format.json { head :no_content }
    end
  end
end
