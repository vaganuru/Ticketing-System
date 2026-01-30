module TicketsHelper
  def badge_class(status)
    case status
    when "Open" then "bg-success"
    when "In Progress" then "bg-primary"
    when "Blocked" then "bg-warning text-dark"
    when "Done" then "bg-secondary"
    else "bg-light text-dark"
    end
  end
end
