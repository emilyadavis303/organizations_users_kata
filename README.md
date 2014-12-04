Organizations Users Code Kata: http://www.adomokos.com/2012/10/the-organizations-users-roles-kata.html

Three levels of organization: Root Organizations, Organizations, Child Organizations

* Only one Root Organization
* Organizations have one parent - the Root Organization
* The Organizations can have any number of Child Organizations
* Child Organizations do not have children

Three different roles in the system: Admin, User, Denied

* Roles are inherited through the organization hierarchy
* If Joe has admin access to Organization_1, then he has admin access to Organization_1's children
* However, if a role is specified to a Child Organization that role takes precedence over an inherited role
