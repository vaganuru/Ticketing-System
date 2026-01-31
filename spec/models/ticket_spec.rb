require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:assignee) { User.create!(first_name: "John", last_name: "Doe", email: "john@example.com") }
  let(:reporter) { User.create!(first_name: "Jane", last_name: "Smith", email: "jane@example.com") }

  let(:valid_attributes) do
    {
      title: "Test Ticket",
      description: "This is a test ticket",
      status: "Open",
      priority: "High",
      assignee: assignee,
      reporter: reporter,
      due_date: Date.today + 7.days,
      tags: "bug,urgent"
    }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      Rails.logger.info "is valid with valid attributes"
      ticket = Ticket.new(valid_attributes)
      expect(ticket).to be_valid
    end

    it "is invalid without a title" do
      Rails.logger.info "Is invalid without a title"
      ticket = Ticket.new(valid_attributes.merge(title: nil))
      expect(ticket).not_to be_valid
      expect(ticket.errors[:title]).to include("can't be blank")
    end

    it "is invalid with status outside STATUS_OPTIONS" do
      Rails.logger.info "is invalid with status outside STATUS_OPTIONS"
      ticket = Ticket.new(valid_attributes.merge(status: "Unknown"))
      expect(ticket).not_to be_valid
      expect(ticket.errors[:status]).to include(
                                          "Then given value must be in given status list values: Open, In Progress, Blocked, Done"
                                        )
    end

    it "is invalid with priority outside PRIORITY_OPTIONS" do
      Rails.logger.info "is invalid with priority outside PRIORITY_OPTIONS"
      ticket = Ticket.new(valid_attributes.merge(priority: "Urgent"))
      expect(ticket).not_to be_valid
      expect(ticket.errors[:priority]).to include(
                                            "Then given value must be in given priority list values: Low, Medium, High, Critical"
                                          )
    end

    it "is invalid if description exceeds 1000 chars" do
      Rails.logger.info "Is invalid if description exceeds 1000 chars"
      ticket = Ticket.new(valid_attributes.merge(description: "a" * 1001))
      expect(ticket).not_to be_valid
      expect(ticket.errors[:description]).to include("must not exceed 1000 characters")
    end
  end

  describe "CRUD operations" do
    it "creates a ticket" do
      Rails.logger.info "Creates a ticket"
      ticket = Ticket.create!(valid_attributes)
      expect(Ticket.find(ticket.id)).to eq(ticket)
    end

    it "reads a ticket" do
      Rails.logger.info "Reads the ticket"
      ticket = Ticket.create!(valid_attributes)
      fetched = Ticket.find(ticket.id)
      expect(fetched.title).to eq("Test Ticket")
    end

    it "updates a ticket" do
      Rails.logger.info "Update a ticket"
      ticket = Ticket.create!(valid_attributes)
      ticket.update!(status: "In Progress", priority: "Medium")
      updated = Ticket.find(ticket.id)
      expect(updated.status).to eq("In Progress")
      expect(updated.priority).to eq("Medium")
    end

    it "deletes a ticket" do
      Rails.logger.info "Deletes a ticket"
      ticket = Ticket.create!(valid_attributes)
      expect { ticket.destroy }.to change { Ticket.count }.by(-1)
    end
  end
end
