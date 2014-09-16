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
