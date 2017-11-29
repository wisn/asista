class Argument

  private
    @command = ""
    @original = ""
    @parameters = []

  public
    def initialize original = ""
      @original = original
    end

    def set_original original = ""
      @original = original
    end

    def set_command command = ""
      @command = command
    end

    def set_parameters params = []
      @parameters = params
    end

    def get_original
      @original
    end

    def get_command
      @command
    end

    def get_parameters
      @parameters
    end

end
