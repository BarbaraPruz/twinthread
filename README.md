# TwinThread Code Challenge

## Environment
* Ruby version 2.6.1
* Rails ~> 5.2.3

## Project Setup
* Fork and clone this GIT repo.
* bundle install
* rake db:migrate

## Running App Notes
To run, rails s

On startup, application will populate the database and so this may take some seconds.
Application will be available at localhost:3000
Navigation bar options:
* Assets (this is also page displayed at startup) : shows index of assets with a search form.
* Critical : lists assets with critical status
* Classes : lists classes.  The View Assets link shows the assets for that class.

## Implementation Notes

### Assumptions
* The id's in JSON (like property_id, class_id, asset_id) are unique.
* For classes, the names are also unique.

### Not Handled and Backlog to do!
* In asset json, the following fields are not processed: Running, Utilization, Performance and Location. I could see these all point to a "Property" but I was wrestling with how to implement those relationships in the model.  (and then ran out of avaiable time!)
* asset parent-children not really connected (model doesn't include relationship)
* JSON dataType is not processed.   
* I approached task with a "red, green, refactor" mindset.  So I think there are likely some performance optimizations that can be considered and some code tweaks for
maintainability.  In other words, I didn't get to the refactor stage.
* user interface : additional things to consider like case insensitive searching, linking information
  (ex. from class list asset view, have link back to show the asset)
* only minimal error handling right now

### Database Seeding
At server start time, Rails will run custom initializer config/initializers/ttassetload.rb.  The initializer verifies that the database exists (tables/schema defined). If so, it empties any current
data and then gets the JSON file and processes.
