# Ticketing System

A simple Rails 8 application to manage tickets with full CRUD functionality. Users can create, view, update, and delete tickets. Tickets include fields like **title, description, assignee, reporter, status, priority, due date, and tags**.

## Table of Contents

- [Prepare Environment](#prepare-environment)  
- [Ruby Version](#ruby-version)  
- [System Dependencies](#system-dependencies)  
- [Configuration](#configuration)  
- [Database Setup](#database-setup)  
- [Running the Application](#running-the-application)  
- [Running Tests](#running-tests)  
- [Ticket Features](#ticket-features)
- [Deployment Instructions](#deployment-instructions)  
- [Assumptions](#assumptions)  
- [Missing](#missing)

---

## Prepare Environment

Run the following commands on **Ubuntu 22.04** to prepare the environment:

```bash
sudo apt-get update -qq
sudo apt-get install -y apt-utils
sudo apt-get install -y -qq libsqlite3-dev
sudo apt-get install -y -qq mysql-client libmysqlclient-dev
sudo apt-get install -y -qq libpq-dev postgresql-client-common postgresql-client
sudo apt-get install -y libzmq3-dev
sudo apt-get install -y nodejs npm
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y dirmngr gnupg2
sudo apt-get install -y libmagickwand-dev imagemagick
sudo apt-get install -y build-essential libssl-dev libreadline-dev zlib1g-dev
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
rails db:seed # Run this for default uses and tickets samples
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
