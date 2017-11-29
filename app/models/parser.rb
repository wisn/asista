module Typeable
  public
    def validType
      raise "Not implemented"
    end
end

class Parser
  include Typeable

  private
    @config = nil
    @argument = nil

  public
    def initialize config = Config.new
      @config = config
    end

    def parse input = ""
      arg = input.split

      @argument = Argument.new input

      @argument.set_command arg[0]
      @argument.set_parameters arg.drop(1)
    end

    def get_argument
      @argument
    end

    def get_result
      res = ""

      if @argument.get_command == "konversi" || @argument.get_command == "ubah"
        converter = Converter.new @argument

        res = converter.get_result
      else
        res = "Aku belum belajar buat ini..."
      end

      return res
    end

    def validType
      type_a = @argument.get_command.instance_of? String
      type_b = @argument.get_original.instance_of? String
      type_c = @argument.get_parameters.instance_of? Array

      return type_a && type_b && type_c
    end

end
