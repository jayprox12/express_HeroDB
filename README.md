# express_HeroDB - REST API that uses Node.js, MongoDB, and Express
Created a REST API using Node.js, Express, and MongoDB to demo Selenium Tests.


Before we begin, you will need to have the following installed: Node.js and MongoDB. (To create a REST API with Node.js, Express, and MongoDB, see: https://closebrace.com/tutorials/2017-03-02/the-dead-simple-step-by-step-guide-for-front-end-developers-to-getting-up-and-running-with-nodejs-express-and-mongodb. My API was built using this tutorial.)
<br /><br />
*Express is a lightweight node.js web application framework. It provides the basic HTTP infrastructure that makes it easy to create REST APIs.
<br />
####Installing Node.js

Go to http://nodejs.org, and click the Install button.
Run the installer that you just downloaded. <br />
When the installer completes, a message indicates that Node was installed at /usr/local/bin/node and npm was installed at /usr/local/bin/npm.<br />
At this point node.js is ready to use. 

<br /><br />
####Installing MongoDB

To install on a specific platform, Refer to https://docs.mongodb.com/v3.0/tutorial

<br />
####Setting up our Database

- Pull or download the files.

- Open a terminal window, cd to the express_HeroDB directory, and execute the following command to install the express module: npm install

- A node_modules folder is created in the express_HeroDB folder, and the Express, MongoDB, and Frisby modules are installed in a subfolder of node_modules.

- In the express_HeroDB directory, create a folder named "data"

- Start server: npm start

- Start mongod, by entering: mongod --dbpath data/

- Start mongo
 

<br />
You can start entering data into the HeroDB on the front-end side. To get started, go to: http://localhost:3000 and enter away values to test it out.

<br />
Examples:

 Add User:
 - Username: The Flash
 - Species: Meta-Human
 - Full Name: Barry Allen
 - Age: 32
 - Location: Central City
 - Gender: Male

 Click the Add User button

 Verify The Flash is listed in the User List table

 Click on The Flash in the UserName column

 Verify The Flash User Info is displayed

 For The Flash, click the edit link

 Verify the Edit fields are populated with The Flash info

 Edit User:
 - Username: Jesse Quick
 - Full Name: Jesse Chambers
 - Age: 23
 - Gender: Female

Click the Confirm Changes button

Verify The Flash info has been changed with the info of Jesse Quick

For Jesse Quick, click the delete link

Verify Jesse Quick is no longer displayed in the User List table


<br /><br /><br /><br />



#####Delete Database (To have a clean database)

 &nbsp;&nbsp;To delete a database in mongo, do the following:
 <br />&nbsp;&nbsp;&nbsp;&nbsp;In mongo, type: use {db_name}
 <br />&nbsp;&nbsp;&nbsp;&nbsp;Verify the following is displayed: switched to db {db_name}
 <br />&nbsp;&nbsp;&nbsp;&nbsp;In mongo, type: db.dropDatabase()
 <br />&nbsp;&nbsp;&nbsp;&nbsp;Verify the following is displayed: { "dropped" : "{db_name}", "ok" : 1 }
  