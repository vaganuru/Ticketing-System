class Ticket < ApplicationRecord
  belongs_to :assignee, class_name: "User", foreign_key: "assignee_id", optional: true
  belongs_to :reporter, class_name: "User", foreign_key: "reporter_id", optional: true

  STATUS_OPTIONS = ["Open", "In Progress", "Blocked", "Done"].freeze
  PRIORITY_OPTIONS = ["Low", "Medium", "High", "Critical"].freeze

  validates :title, presence: true

  validates :description, length: { maximum: 1000,
                                    too_long: "must not exceed %{count} characters" }, allow_blank: true

  validates :status, presence: true
  validate :status_inclusion

  validates :priority, presence: true
  validate :priority_inclusion
  validates :due_date, presence: true
  validate  :due_date_cannot_be_in_the_past

  scope :search, ->(query) {
    q = "%#{query}%"

    joins(
      "LEFT JOIN users assignees ON assignees.id = tickets.assignee_id
     LEFT JOIN users reporters ON reporters.id = tickets.reporter_id"
    ).where(
      "tickets.title LIKE :q
     OR tickets.description LIKE :q
     OR tickets.status LIKE :q
     OR tickets.priority LIKE :q
     OR assignees.first_name LIKE :q
     OR assignees.last_name LIKE :q
     OR reporters.first_name LIKE :q
     OR reporters.last_name LIKE :q",
      q: q
    )
  }

  private

  def due_date_cannot_be_in_the_past
    return if due_date.blank?
    if due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end

  def status_inclusion
    return if status.blank? # skip if empty (presence already handled)

    unless STATUS_OPTIONS.include?(status)
      errors.add(:status, "Then given value must be in given status list values: #{STATUS_OPTIONS.join(', ')}")
    end
  end

  def priority_inclusion
    return if priority.blank? # skip if empty (presence already handled)

    unless PRIORITY_OPTIONS.include?(priority)
      errors.add(:priority, "Then given value must be in given priority list values: #{PRIORITY_OPTIONS.join(', ')}")
    end
  end

end