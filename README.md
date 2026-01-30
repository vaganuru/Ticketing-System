# Ticketing System

A simple Rails 8 application to manage tickets with full CRUD functionality. Users can create, view, update, and delete tickets. Tickets include fields like title, description, assignee, reporter, status, priority, due date, and tags.  

## Table of Contents
1. [Prepare Environement](#prepare-environment)
2. [Ruby Version](#ruby-version)  
3. [System Dependencies](#system-dependencies)  
4. [Configuration](#configuration)  
5. [Database Setup](#database-setup)  
6. [Running the Application](#running-the-application)  
7. [Running Tests](#running-tests)  
8. [Deployment Instructions](#deployment-instructions)  
9. [Assumptions](#assumptions)  

## Prepare Environment
```bash
    - apt-get update -qq
    - apt-get install -y apt-utils
    - apt-get install -y -qq libsqlite3-dev
    - apt-get install -y -qq mysql-client libmysqlclient-dev
    - apt-get install -y -qq libpq-dev postgresql-client-common postgresql-client
    - apt-get install -y libzmq3-dev
    - apt-get install -y nodejs
    - apt-get install -y git
    - apt-get install -y curl
    - apt-get install -y libkrb5-dev
    - apt-get install -y dirmngr gnupg2 curl
    - apt-get install -y libmagickwand-dev

## Ruby Version

- Ruby 3.3.0  
- Rails 8.0.4  

Make sure you are using **RVM**, **rbenv** to manage Ruby versions.

## System Dependencies

- SQLite3 (for development and test)  
- A modern browser (Chrome, Firefox, Edge)

## Configuration

1. Clone the repository:  
```bash
git clone https://github.com/vaganuru/Ticketing-System.git
cd Ticketing-System
