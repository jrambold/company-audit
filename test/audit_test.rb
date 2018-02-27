require './test/test_helper'
require './lib/company'
require './lib/audit'
require './lib/timesheet'

class AuditTest < Minitest::Test
  def setup
    @company = Company.new
    @company.load_employees('./data/employees.csv')
    @company.load_projects('./data/projects.csv')
    @company.load_timesheets('./data/timesheets.csv')

    @audit = Audit.new
    @audit.load_company(@company)
  end

  def test_instantiation
    assert_instance_of Audit, @audit
  end

  def test_load_company
    assert_equal @company, @audit.company
  end

  def test_invalid_days_worked
    skip
    assert_equal "Invalid Days Worked:\nNone", @audit.were_invalid_days_worked
  end

  def test_build_report
    employee_id = '1'
    project_id = '1'
    date = '2015-01-01'
    minutes = '120'
    timesheet0 = Timesheet.new(employee_id, project_id, date, minutes)

    employee_id = '2'
    project_id = '2'
    date = '2015-01-01'
    minutes = '120'
    timesheet1 = Timesheet.new(employee_id, project_id, date, minutes)

    expected = " "
    assert_equal expected, @audit.build_report([timesheet0],[timesheet1])
  end
end
