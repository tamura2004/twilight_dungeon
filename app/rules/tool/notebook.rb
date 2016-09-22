class Tool::Notebook
  attr_accessor :message

  def initialize
    @message=""
    yield self if block_given?
  end

  def log(str)
    @message += str + "\n"
  end
end
