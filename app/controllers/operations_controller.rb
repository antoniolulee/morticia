class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]

  # GET /operations or /operations.json
  def index
    
    @q = Operation.where(status: 1).ransack(params[:q])
    #Sort operations by created_at
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @operations = @q.result(distinct: true).page(params[:page])

  end

  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)

    @operation.user = current_user

    @operation.ltv_appraisal = (@operation.requested_money / @operation.appraisal_price) * 100

    @operation.ltv_buying = (@operation.requested_money / @operation.buying_price) * 100

    @operation.status = 0

    interest_rate = 0.017 / 12
    n = (@operation.years_duration * 12).to_f
    c = @operation.requested_money
    a1 = c * interest_rate
    a2 = 1 - (1 + interest_rate) ** -n
    a = a1 / a2
    salary = @operation.annual_gross_income / 12

    @operation.stress_test = (a / salary) * 100

    respond_to do |format|
      if @operation.save
        format.html { redirect_to your_operations_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def your_operations
    #operation where user_id = current_user.id sort by created_at
    @operations = Operation.where(user_id: current_user.id).order(created_at: :desc)
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:requested_money, :buying_price, :appraisal_price, :years_duration, :year_of_birth, :annual_gross_income, :city, :name, :interest_type, :reference_id, :phone_number)
    end
end
