module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | TestBed"      
    end
  end
end
