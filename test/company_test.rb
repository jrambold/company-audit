require './test/test_helper'
require './lib/company'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class CompanyTest < Minitest::Test
  def setup
    @company = Company.new
    @company.load_employees('./data/employees.csv')
    @company.load_projects('./data/projects.csv')
    @company.load_timesheets('./data/timesheets.csv')
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
    assert_equal 3, @company.projects.length

    project = @company.projects.first

    assert_equal 1, project.id
    assert_equal 'Widgets', project.name
    assert_equal Date.new(2016, 01, 01), project.start_date
    assert_equal Date.new(2016, 06, 30), project.end_date
  end

  def test_load_timesheets
    assert_equal 25, @company.timesheets.length

    timesheet = @company.timesheets.first

    assert_equal 1, timesheet.employee_id
    assert_equal 1, timesheet.project_id
    assert_equal Date.new(2016,01,01), timesheet.date
    assert_equal 480, timesheet.minutes
  end

  def test_load_good_bad_employees
    expected_good = {success: true, error: nil}

    assert_equal expected_good, @company.load_employees('./data/employees.csv')

    expected_bad = {success: false, error: 'bad data'}

    assert_equal expected_bad, @company.load_employees('./data/bad_employees.csv')
  end

  def test_load_good_bad_projects
    expected_good = {success: true, error: nil}

    assert_equal expected_good, @company.load_projects('./data/projects.csv')

    expected_bad = {success: false, error: 'bad data'}

    assert_equal expected_bad, @company.load_projects('./data/bad_projects.csv')
  end

  def test_load_good_bad_timesheets
    expected_good = {success: true, error: nil}

    assert_equal expected_good, @company.load_timesheets('./data/timesheets.csv')

    expected_bad = {success: false, error: 'bad data'}

    assert_equal expected_bad, @company.load_timesheets('./data/bad_timesheets.csv')
  end
end
