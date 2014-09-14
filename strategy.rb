# Strategy class 1
class HTMLFormatter
  def output_report(context)
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{context.title}</title>"
    puts '  </head>'
    puts '  <body>'
    context.text.each do |line|
      puts "    <p>#{line}</p>"
    end
    puts ' </body>'
    puts '</html>'
  end
end

# Strategy class 2
class PlainTextFormatter
  def output_report(context)
    puts "**** #{context.title} ****"
    context.text.each do |line|
      puts line
    end
  end
end

# Context class
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end

# Same thing using Proc
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end

# class HTMLFormatter now becomes a Lambda
HTML_FORMATTER = lambda do |context|
  puts '<html>'
  puts '  <head>'
  puts "    <title>#{context.title}</title>"
  puts '  </head>'
  puts '  <body>'
  context.text.each do |line|
    puts "    <p>#{line}</p>"
  end
  puts ' </body>'
  puts '</html>'
end

# Generate report
report = Report.new(&HTML_FORMATTER)
report.output_report
