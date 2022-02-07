# frozen_string_literal: true
class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
  validates :email, uniqueness: true
  # enum :salary, ["30000", "40000", "50000", "60000"]

  # def update_with_conflict_validation(*args)
  #   update_attribute(*args)
  #   rescue ActiveRecord::StaleObjectError
  #     errors.add :base, "This record changed while you were editing."
  #     false
  # end
  def self.search_email_display_all(search)
    if search
      employee = Employee.find_by(email: search)
      if employee
        Employee.where(id: employee.id)
      else
        Employee.all
      end
    else
      Employee.all
    end
  end

  Employee.transaction do
    employee = Employee.lock.find_by(first_name: "Hardik")
    employee.update(salary:'56000')
    employee.lock!
  end
  
end

