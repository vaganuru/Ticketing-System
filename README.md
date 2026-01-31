# Ticketing System

A simple Rails 8 application to manage tickets with full CRUD functionality. Users can create, view, update, and delete tickets. Tickets include fields like **title, description, assignee, reporter, status, priority, due date, and tags**.

## Table of Contents

- [Setup Instructions](#setup-instructions)  
- [Ruby Version](#ruby-version)  
- [System Dependencies](#system-dependencies)  
- [Configuration](#configuration)  
- [Database Setup](#database-setup)  
- [Running the Application](#running-the-application)  
- [Running Tests](#running-tests)  
- [Ticket Features](#ticket-features)
- [Deployment Instructions](#deployment-instructions)  
- [Assumptions](#assumptions)  
- [Missing Functionalities](#missing-functionalities)

---

## Setup Instructions

The development environment was set up and tested on Ubuntu 22.04.

```bash
sudo apt-get update -qq
sudo apt-get install -y apt-utils
sudo apt-get install -y -qq libsqlite3-dev
sudo apt-get install -y -qq mysql-client libmysqlclient-dev
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y libmagickwand-dev imagemagick

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
echo rvm_autoupdate_flag=2 >> ~/.rvmrc
rvm reload
rvm requirements

rvm install ruby-3.3.0
rvm alias create default ruby-3.3.0
ruby -v
which ruby
```

---

## Ruby Version

- Ruby **3.3.0**  
- Rails **8.0.4**  

Use **RVM** or **rbenv** to manage Ruby versions.

---

## System Dependencies

- SQLite3 (for development and test)  
- A modern browser (Chrome, Firefox)

---

## Configuration

1. Clone the repository:

```bash
git clone https://github.com/vaganuru/Ticketing-System.git
cd Ticketing-System
```

2. Install required gems:

```bash
bundle install
```

---

## Database Setup

Create and migrate the database:

```bash
rails db:create
rails db:migrate
rails db:seed # Run this for default users and tickets samples
```

---

## Running the Application

Start the Rails server:

```bash
rails server
```

Open your browser at [http://localhost:3000](http://localhost:3000)

---

## Running Tests

Run the RSpec test suite:

```bash
rails db:create RAILS_ENV=test
rails db:migrate RAILS_ENV=test
bundle exec rspec
```

All model validations and CRUD operations are covered in the tests.

---

## Ticket Features

- **Search & Filter**: Users can search tickets by title, status, priority, assignee, or reporter.
- **CRUD Operations**: Create, view (modal popup), edit, and delete tickets.
- **Validation**: Status and Priority must be one of the defined options. Description limited to 1000 characters.
- **Tags**: Comma-separated values.
---

## Deployment Instructions

- Deploy like any standard Rails app.  
- Ensure database credentials are configured in `config/database.yml`.  
- Precompile assets if using production:  

```bash
rails assets:precompile RAILS_ENV=production
```
---

## Assumptions

- Users must exist before assigning tickets.  
- Tags are stored as **comma-separated values**.  
- Status and Priority have fixed options:

```ruby
STATUS_OPTIONS = ["Open", "In Progress", "Blocked", "Done"]
PRIORITY_OPTIONS = ["Low", "Medium", "High", "Critical"]
```

- Description is limited to 1000 characters.  
- Ticket modal views are used instead of separate show pages.

---
## Missing functionalities
- **Sorting:**  Basic column sorting is planned for the tickets index page (e.g., by status, priority, due date).
- **Enhanced Search & Filters:** Support filtering by assignee, reporter, status, priority, and due dates.
- **UI/UX Improvements:** Refine responsiveness, accessibility, and visual indicators (status/priority badges).
- **Pagination:**  Ticket listing currently displays all records. Pagination would be added to improve performance and usability for larger datasets.
- **Authentication & Authorization:** Introduce user authentication and role-based permissions for better access control.
- **Comments & Activity History:** Track ticket updates, comments, and status changes for better collaboration.
- **Automated Tests:**  
  - **Model tests:** Core model validations are covered using RSpec.  
  - **Controller / Feature tests (BDD):** End-to-end browser tests (e.g., user flows for creating, updating, and deleting tickets) are yet to be implemented.
