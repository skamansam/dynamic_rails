class ConstraintsController < ApplicationController
  # GET /constraints
  # GET /constraints.json
  def index
    @constraints = Constraint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @constraints }
    end
  end

  # GET /constraints/1
  # GET /constraints/1.json
  def show
    @constraint = Constraint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @constraint }
    end
  end

  # GET /constraints/new
  # GET /constraints/new.json
  def new
    @constraint = Constraint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @constraint }
    end
  end

  # GET /constraints/1/edit
  def edit
    @constraint = Constraint.find(params[:id])
  end

  # POST /constraints
  # POST /constraints.json
  def create
    @constraint = Constraint.new(params[:constraint])

    respond_to do |format|
      if @constraint.save
        format.html { redirect_to @constraint, notice: 'Constraint was successfully created.' }
        format.json { render json: @constraint, status: :created, location: @constraint }
      else
        format.html { render action: "new" }
        format.json { render json: @constraint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /constraints/1
  # PUT /constraints/1.json
  def update
    @constraint = Constraint.find(params[:id])

    respond_to do |format|
      if @constraint.update_attributes(params[:constraint])
        format.html { redirect_to @constraint, notice: 'Constraint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @constraint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constraints/1
  # DELETE /constraints/1.json
  def destroy
    @constraint = Constraint.find(params[:id])
    @constraint.destroy

    respond_to do |format|
      format.html { redirect_to constraints_url }
      format.json { head :no_content }
    end
  end
end
