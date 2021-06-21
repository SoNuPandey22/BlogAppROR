class Post < ApplicationRecord
	#black title or post are not allowed
	before_validation :preval
	validates_presence_of :title
	validates_presence_of :content
	private
	  def preval
	    if self.title
	      self.title = self.title.strip
	    end
	    if self.content
	      self.content = self.content.strip
	    end
	end
end
