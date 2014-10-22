# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tasks = Task.create([
    {name: 'Clear a kitchen',
     project_id: 1,
     prio: false,
     deadline: '2014-12-12 01:02:03',
     done: false
    },
    {name: 'Build a house',
     project_id: 1,
     prio: true,
     deadline: '2015-12-12 01:02:03',
     done: false
    }])
Project.create([
    id: 1,
    name: 'My project 1',
    user_id: 1
         ])
