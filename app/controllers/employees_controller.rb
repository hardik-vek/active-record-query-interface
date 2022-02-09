# frozen_string_literal: true
class EmployeesController < ApplicationController
  before_action :create_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.search_email_display_all(params[:search])
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_create_by(input_params)
    if @employee.save
      flash[:notice] = "Employee created sucessfully"
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(input_params)
      flash[:notice] = "Employee Updateed sucessfully"
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def display
  end

  private

  def input_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_avilable, :salary)
  end

  def create_employee
    @employee = Employee.find(params[:id])
  end
end

