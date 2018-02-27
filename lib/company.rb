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
      @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def load_projects(filename)
    CSV.foreach(filename) do |row|
      @projects << Project.new(row[0], row[1], row[2], row[3])
    end
  end

  def load_timesheets(filename)
    CSV.foreach(filename) do |row|
      @timesheets << Timesheet.new(row[0], row[1], row[2], row[3])
    end
  end
end
