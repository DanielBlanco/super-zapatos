module ApplicationHelper
  
  def success_status
    response.status.between? 200,226
  end
  
end
