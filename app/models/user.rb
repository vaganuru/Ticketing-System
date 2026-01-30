class User < ApplicationRecord

  has_many :assigned_tickets, class_name: "Ticket", foreign_key: "assignee_id", dependent: :nullify
  has_many :reported_tickets, class_name: "Ticket", foreign_key: "reporter_id", dependent: :nullify

  def full_name
    "#{first_name} #{last_name}"
  end
end
