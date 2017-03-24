# School Managmenet System : it is used with maven build.

//import database
$ mysql -h localhost -u root -p <database-name> < school_management.sql

//start jetty server with maven plugin
$ mvn clean jetty:run

Test with  browsers : http://localhost:8080