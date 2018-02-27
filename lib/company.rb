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
  end

  def load_projects(filename)
  end

  def load_timesheets(filename)
  end
end
