class Config

  private
    @config = {}

  public
    def initialize config = {}
      @config = config
    end

    def set_config config = {}
      @config = config
    end

    def get_config
      @config
    end

end
