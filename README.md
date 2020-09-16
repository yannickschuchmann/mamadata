MamaData
========
![Sharana](http://mamadata.sharana.org/images/sharana_logo.png "Sharana.org")

MamaData is the digital implementation of the relationship model of [**Sharana organisation**](http://sharana.org)

The organisation provides several **programs** for helping the supported people of Sharana, called **beneficiaries**.
Each beneficiary can be a part of each program. **Benefits** categorize a program, through which a beneficiary can get a **incident**.
**Incidents** are the real goods or services, valued in rupees, a beneficiary can get.
Basically this is the main concept of the system. But there are more features, listed in the next section.

Features
--------
- Supporter section, special godfather role
- Beneficiaries can have a godfather with file uploads (letters e.g.)
- School and school classes with file uploads (certificates e.g.) for beneficiaries using Paperclip
- Beneficiaries can be wrapped in families - which are members of the community development program
- Autocomplete for several input fields for database consistency
- Kaminari Paginator for Overviews
- Devise for registration and CanCan for user rights
- Reporting / Excel export
- optional journal/blogging feature to cover every beneficiary event

Installation
------------
Install MamaData by running:

    # clone repository
    git clone https://github.com/yannickschuchmann/mamadata

    # bundle 
    cd mamadata_rails4
    bundle install (or bundle install --without production with mysql problems)

    # setup db with seeds
    rake db:setup

    # start server in development mode
    rails s

    # open MamaData at http://0.0.0.0:3000 in your browser

User roles
----------
Currently MamaData supports 5 different user roles - **please differentiate between user roles and roles in a family!**.

### Admin
As an administrator you have full access to every page which means you can create, read. update and delete an entity.
### Social Worker
On one hand social workers have to manage beneficiaries and their relations to families, programs and benefits and they even have to create incidents for them.
So they have the ability to create, read, update and delete beneficiaries, families and incidents. But they can not edit the granting status of an incident
### Accountant
Accountants can edit Benefits and have full management right to incidents. It's their task to administrate the granting status of an incident.
### Supporter
Supporters can read everything except application settings (Roles, DonorTypes, Users)
### Sharana_France
As a special version of a supporter, they can **only** manage their own supporter, (with DonorTypeId == 1)

Organizations Workflow
----------------------
### Incidents

Incidents are the real goods or services, valued in rupees, a beneficiary can get. Think of it like issue tickets just with different values.
Incndents can placed by the social worker. They can only be submitted in the beneficiary file the Incident should belong to.
The accountants responsibility is to either grant or dismiss the incident.


### Benefits
A category in which the Incidents will be placed in
The Benefit belongs to one or more programs

- The **individual** amount for the incident is set by the social worker individually
- **calculated amount**  is set by the administrator or the accountant. Here there is an overall budget which gets divided by a specific number of benficiaries
- The **fixed** amount is set by the administrator or the accountant to ensure beneficiaries getting the same amount, for example mobile fees, regardless of their actual costs

### Programs
Programs are groups which consist of one or multiple Benefit(s)

### User Accounts
Due to security reasons a new user can only be added by the administrator. He also defines the users role in the organization
and the initial password which can be changed after the first login via profile settings

### Families
A familiy should be created **after** every member of the family is recorded as a beneficiary
After creating such a family there will be a family questionaire

### Godfather
The Sharana_France Role has an option to be a godfather for one particular beneficiary.
In case the beneficiary has a godfather there are options to upload documents related to the godfather in the beneficairy file

Contribute
----------
- Issue Tracker: [github.com/yannickschuchmann/mamadata/issues](https://github.com/yannickschuchmann/mamadata/issues)
- Source Code: [github.com/yannickschuchmann/mamadata](https://github.com/yannickschuchmann/mamadata)

Support
-------
If you are having issues, please contact us.
