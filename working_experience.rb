require 'date'

# Class to hold and calculate total working experience over career
class WorkingExperience
  # START_TIME = ::Date.new(1999, 01, 01)
  # END_TIME = ::Date.new(2020, 12, 31)
  # MONTHS ||= (START_TIME..END_TIME).select { |d| d.day == 1 }

  attr_reader :job_ranges, :experience

  def initialize(args)
    @job_ranges = prepare_date_ranges(args)
    @experience = {}
  end

  def prepare_date_ranges(jobs)
    jobs.map do |e|
      e.split('-').map { |x| ::Date.parse(x) }
    end
  end

  def update_work_experience
    job_ranges.each do |job|
      job_start, job_end = job
      months_worked = (job_start..job_end).select { |d| d.day == 1 }
      months_worked.each { |x| experience[x] = true }
    end
    self
  end

  def calculate_work_experience
    update_work_experience if experience.empty?
    experience.count { |_, v| v == true }
  end

  def years_of_experience
    (calculate_work_experience / 12).floor
  end
end

ARGF.each_line do |line|
  years = line.chomp.split('; ')
  obj = WorkingExperience.new(years)
  puts obj.years_of_experience
end
