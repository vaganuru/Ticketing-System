# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


# Clear existing data (optional, for development)
Ticket.destroy_all
User.destroy_all

puts "Creating users..."

# Create default users
users = [
  { first_name: "Alice", last_name: "Smith", email: "alice@example.com" },
  { first_name: "Bob", last_name: "Johnson", email: "bob@example.com" },
  { first_name: "Charlie", last_name: "Brown", email: "charlie@example.com" }
]

users = users.map { |u| User.create!(u) }

puts "Created #{User.count} users."

puts "Creating tickets..."

# Create tickets
tickets = [
  {
    title: "Fix login bug",
    description: "Users cannot log in after recent update.",
    status: "Open",
    priority: "High",
    assignee: users[0],
    reporter: users[1],
    due_date: Date.today + 7.days,
    tags: "bug,login"
  },
  {
    title: "Add search feature",
    description: "Implement search functionality for tickets.",
    status: "In Progress",
    priority: "Medium",
    assignee: users[1],
    reporter: users[2],
    due_date: Date.today + 14.days,
    tags: "feature,enhancement"
  },
  {
    title: "Update README",
    description: "Update project README with setup instructions.",
    status: "Open",
    priority: "Low",
    assignee: users[2],
    reporter: users[0],
    due_date: Date.today + 3.days,
    tags: "documentation"
  }
]

tickets.each { |t| Ticket.create!(t) }

puts "Created #{Ticket.count} tickets."
