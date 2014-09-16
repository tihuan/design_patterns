class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def on_button_push
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    # Save the current document
  end
end

save_button = SlickButton.new(SaveCommand.new)

# More complex example
class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end
end

# New command subclass
class CreateFile < Command
  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

# New command subclass
class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    # Check file existence before save contents
    if File.exists?(@path)
      @contents = File.read(@path)
    end
    f = File.delete(@path)
  end

  def unexecute
    if @contents
      f = File.open(@path, "w")
      f.write(@contents)
      f.close
    end
  end
end

# new command subclass
class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end
end

# CompositeCommand to collect all subcommands
class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  def unexecute
    @commands.reverse_each { |cmd| cmd.unexecute }
  end

  def description
    description = ""
    @commands.each { |cmd| description += cmd.description + "\n"}
    description
  end
end

# CompositeCommand example
cmds = CompositeCommand.new

cmds.add_command(CreateFile.new('file1.txt', "hello world\n"))
cmds.add_command(CopyFile.new('file1.txt', 'file2.txt'))
cmds.add_command(DeleteFile.new('file1.txt'))

cmds.execute
puts cmds.description

# Command example with Madeleine
# New Exmployee class
require 'rubygem'
require 'madeleine'

class Employee
  attr_accessor :name, :number, :address

  def initialize(name, number, address)
    @name = name
    @number = number
    @address = address
  end

  def to_s
    "Employee: name: #{name}, num: #{number}, addr: #{address}"
  end
end

class EmployeeManager
  def initialize
    @employees = {}
  end

  def add_employee(e)
    @employees[e.number] = e
  end

  def change_address(number, address)
    employee = @employee[number]
    raise "No such employee" if not employee
    employee.address = address
  end

  def delete_employee(number)
    @employees.remove(number)
  end

  def find_employee(number)
    @employee[number]
  end
end
