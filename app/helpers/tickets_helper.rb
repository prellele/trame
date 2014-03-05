module TicketsHelper

  def sum_open_tickets
    sum_open_tickets = Ticket.where(closed: false).order(:deadline).count
  end

  def sum_closed_tickets
    sum_open_tickets = Ticket.where(closed: true).order(:deadline).count
  end
 
end
