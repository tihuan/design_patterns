# Delegate!!!
# Strategy abstract class
class Formatter
  def output_report(title, text)
    raise "Abstract method called"
  end
end

# Strategy subclass
class HTMLFormatter < Formatter
  def output_report(title, text)
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{title}</title>"
    puts '  </head>'
    puts '  <body>'
    text.each do |line|
      puts "    <p>#{line}</p>"
    end
    puts ' </body>'
    puts '</html>'
  end
end

# Strategy subclass
class PlainTextFormatter < Formatter
  def output_report(title, text)
    puts "**** #{title} ****"
    text.each do |line|
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
