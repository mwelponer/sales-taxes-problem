README
=======

Michele Welponer, a simple shopping cart.
Copyright (C) 2016  Michele Welponer

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

---

Prerequisites
---------
- RVM (Ruby Version Manager) v. 1.26.11
- Ruby v. 2.2.1
- Rails v. 4.2.6

Installation
---------

Download, unzip and copy the source code folder "sales-taxes-problem-master" to your computer. Create a new gemset. Install all the dependencies specified in the Gemfile with bundler.

```
$ cd sales-taxes-problem-master

$ rvm gemset create MYgemset
$ echo rvm 2.2.1@MYgemset --create > .rvmrc
$ cd ..
$ cd sales-taxes-problem-master

$ bundle install
```

Database creation
---
Let's use "sqlite3" for simplicity as configured in the database yaml configuration file $/config/database.yml$
Recreate the database schema through the migrations.

```
$ rake db:create
$ rake db:migrate
```

Database initialization
---
Initialize the database with the products, as specified in the seeds file $/db/seeds.rb$

```
$ rake db:seed
```

Run the app in localhost
---------
Run rails server and reach the app through the browser in localhost on the default port 3000.

```
$ cd sales-taxes-problem-master
$ rails s

http://localhost:3000
```
