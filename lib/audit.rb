class Audit
  attr_reader :company

  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_days_worked
    invalid_employees = invalid_employee_ids
    invalid_projects = invalid_project_ids
    build_report(invalid_employees,invalid_projects)
  end

  def build_report(employees, projects)
    report = "Invalid Days Worked:\n"
    employees.each do |timesheet|
      project = @company.find_project_by_id(timesheet.project_id).name
      report += "#{timesheet.employee_id} ID worked on #{project} "
      report += "on #{timesheet.date}, Employee ID is invalid"
    end
    projects.each do |timesheet|
      name = @company.find_employee_by_id(timesheet.employee_id).name
      project = @company.find_project_by_id(timesheet.project_id).name
      report += "#{name} worked on #{project} on #{timesheet.date}, "
      report += "Project ID is invalid"
    end
  end

  def invalid_employee_ids
    invalid_employees = []
    @company.timesheets.each do |timesheet|
      unless @company.employees.include?(timesheet.employee_id)
        invalid_employees << timesheet
      end
    end
  end

  def invalid_project_ids
    invalid_projects = []
    @company.timesheets.each do |timesheet|
      unless @company.employees.include?(timesheet.project_id)
        invalid_projects << timesheet
      end
    end
  end
end
