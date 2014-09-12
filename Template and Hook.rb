class Report
  def initialize
    @title = "Monthly Report"
    @text = %w(Things are going well)
  end

  def output_report
    output_start
    output_head
    @text.each do |line|
      output_line(line)
    end
    output_end
  end

  def output_start
  end

  def output_head # Abstract
    raise "Called abstact method: output_head"
  end

  def output_body_start
  end

  def output_line(line) # Abstract
    raise "Called abstract method: output_line"
  end

  def output_body_end
  end

  def output_end
  end
end

# AReport uses Report as a Template
class AReport < Report
  def output_head # Overridden default
    output_line(@title)
  end
end

#########################



