class Action

  protected
    @result = ""
    @command = ""
    @arguments = []

  public
    def initialize arguments = Argument.new
      @arguments = Array.new
      
      @arguments.push arguments.get_command
      @arguments += arguments.get_parameters
    end

    def set_result result = ""
      @result = result
    end

    def set_command command = ""
      @command = command
    end

    def set_arguments arguments = Argument.new
      @arguments = arguments.get_command + arguments.get_parameters
    end

    def get_result
      @result
    end

    def get_command
      @command
    end

    def get_arguments
      @arguments
    end

end
