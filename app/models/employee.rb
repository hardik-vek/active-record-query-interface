# frozen_string_literal: true
class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
  validates :email, uniqueness: true

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

  def self.increase_no_of_order
    Employee.find_in_batches(start: 1, finish: 10) do |emp|
      emp.each do |e|
        e.no_of_order += 1
        e.save
        print e.no_of_order
      end
    end
  end

  def self.decrease_no_of_order
    Employee.find_in_batches(start: 1, finish: 10) do |emp|
      emp.each do |e|
        e.no_of_order -= 1
        e.save
        print e.no_of_order
      end
    end
  end

  Employee.transaction do
    employee = Employee.lock.find_by(first_name: "eFname1")
    employee.update(salary: "55000")
    employee.lock!
  end
end

