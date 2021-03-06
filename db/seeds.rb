# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require Rails.root.join("app/models/user.rb")

def create_admin_user
  unless User.first
    admin_user = User.new(:name => "admin")
    admin_user.email = "admin@camome.com"
    admin_user.password = "adminadmin" # ※over 6 char
    admin_user.save
    puts "ok: admin user is created."
    puts "  name: " + admin_user.name
    puts "  email: " + admin_user.email
    puts "  password: " + admin_user.password
  else
    puts "User already exist"
  end
end

def create_inbox_recurrence
  Recurrence.create(:name => "inbox")
  puts "ok: inbox recurrence is created"
end

def create_other_recurrence
  Recurrence.create(:name => "other")
  puts "ok: other recurrence is created"
end

def create_default_states
  State.create( name: "TODO",
                color: "#e65757",
                position: 1,
                default: true )
  State.create( name: "STARTED",
                color: "#00f5ff",
                position: 2,
                default: false )
  State.create( name: "WAIT",
                color: "#4ad0b7",
                position: 3,
                default: false )
  State.create( name: "POSTPONE",
                color: "#ff00ff",
                position: 4,
                default: false )
  State.create( name: "MAYBE",
                color: "#ffe100",
                position: 5,
                default: false )
  State.create( name: "CANCELED",
                color: "#ffdead",
                position: 6,
                default: false )
  State.create( name: "DONE",
                color: "#9fffa6",
                position: 100,
                default: false )
end

create_admin_user
create_inbox_recurrence
create_other_recurrence
