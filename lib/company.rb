require 'csv'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filename)
    CSV.foreach(filename) do |row|
      if row.length != 5 || row.include?(nil)
        @employees = []
        break
      end
      @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
    end
    if @employees == []
      {success: false, error: 'bad data'}
    else
      {success: true, error: nil}
    end
  end

  def load_projects(filename)
    CSV.foreach(filename) do |row|
      if row.length != 4 || row.include?(nil)
        @projects = []
        break
      end
      @projects << Project.new(row[0], row[1], row[2], row[3])
    end
    if @projects == []
      {success: false, error: 'bad data'}
    else
      {success: true, error: nil}
    end
  end

  def load_timesheets(filename)
    CSV.foreach(filename) do |row|
      if row.length != 4 || row.include?(nil)
        @timesheets = []
        break
      end
      @timesheets << Timesheet.new(row[0], row[1], row[2], row[3])
    end
    if @timesheets == []
      {success: false, error: 'bad data'}
    else
      {success: true, error: nil}
    end
  end

  def find_employee_by_id(employee_id)
    @employees.find { |employee| employee.id == employee_id }
  end

  def find_project_by_id(project_id)
    @projects.find { |project| project.id == project_id }
  end
end
