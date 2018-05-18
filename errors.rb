module Errors

	class FileNotFoundError < StandardError

	  def initialize(message)
	    super(message)
	  end  
	  
	end

end