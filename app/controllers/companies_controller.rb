class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  layout "company", only: :show

  # GET /companies
  # GET /companies.json
  def index
    if current_user.present? and current_user.admin?
      redirect_to manage_companies_path
    else
      @category = Category.find_by_id(params[:category_id])
      @city = City.find_by_id(params[:city_id])

      @filterrific = initialize_filterrific(
        Company,
        params[:filterrific],
        select_options: {
          sorted_by: Company.options_for_sorted_by,
        }
      ) or return
      @companies = @filterrific.find.page(params[:page])
      @companies = @filterrific.find.where(:city_id => @city.id).page(params[:page]) if params[:city_id].present?

      if params[:filterrific].present?
        @category = Category.find_by_id(params[:filterrific][:category_id])
        @city = City.find_by_id(params[:filterrific][:city_id])
      end

      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def manage_companies
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.build_address
    @company.company_pictures.build
    @company.contact_infos.build
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
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

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :tax_id, :picture, :logo, :description, :priority, :city_id, :facebook, :instagram, :whatsapp, :company_categories => [],
                                      :address_attributes => [:street, :neighbohood, :number, :zip_code, :city, :complement],
                                      :company_pictures_attributes => [:picture, :id, :_destroy, :company_id],
                                      :contact_infos_attributes => [:name, :icon, :contact, :id, :_destroy])
    end
end
