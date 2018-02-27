require './test/test_helper'
require './lib/company'
require './lib/audit'

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
end
