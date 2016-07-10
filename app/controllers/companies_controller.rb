class CompaniesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :update, :destroy, :new, :edit, :show]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_filter :rootlaw!, only: [:create, :update, :destroy, :new, :edit]


  load 'update_locale.rb'
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.order("id").all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
   @company = Company.order("id").find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.order("id").find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @a = UpdateLocale.new
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
        @a.filling_locale
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @a = UpdateLocale.new
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
         @a.filling_locale
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :city, :country)
    end
end
