require './test/test_helper'
require './lib/company'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class CompanyTest < Minitest::Test
  def setup
    @company = Company.new
    @company.load_employees('./data/employees.csv')
  end

  def test_instantiation
    assert_instance_of Company, @company
  end

  def test_load_employees
    assert_equal 2, @company.employees.length

    employee = @company.employees.first

    assert_equal 1, employee.employee_id
    assert_equal 'Susan Smith', employee.name
    assert_equal 'Manager', employee.role
    assert_equal Date.new(2016,01,01), employee.start_date
    assert_equal Date.new(2018,02,20), employee.end_date
  end

  def test_load_projects
    skip
  end

  def test_load_timesheets
    skip
  end
end
