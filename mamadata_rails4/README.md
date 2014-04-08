MamaData
========

MamaData is the digital implementation of the relationship model of [**Sharana organisation**](http://sharana.org)

The organisation provides several **programs** for helping the supported people of Sharana, called **beneficiaries**.
Each beneficiary can be a part of each program. **Benefits** categorize a program, through which a beneficiary can get a **incident**.
**Incidents** are the real goods or services, valued in rupees, a beneficiary can get.
Basically this is the main concept of the system. But there are more features, listed in the next section.

Features
--------

- Supporter section, special godfather role
- Beneficiaries can have a godfather with file uploads (letters e.g.)
- School and school classes with file uploads (certificates e.g.) for beneficiaries
- Beneficiaries can be wrapped in families - which are members of the community development program


Installation
------------

Install MamaData by running:

    # clone repository
    git clone https://github.com/yannickschuchmann/mamadata

    # bundle and setup db with seeds
    cd mamadata_rails4
    bundle install && rake db:setup

    # start server in development mode
    rails s

    # open MamaData at http://0.0.0.0:3000 in your browser

User roles
----------

Currently MamaData supports 5 different user roles - **please differentiate between user roles and roles in a family!**.

###Admin
As an administrator you have full access to every page which means you can create, read. update amd delete an entity.
###Social Worker
on one hand social workers have to manage beneficiaries and their relations to families, programs and benefits and they even have to create incidents for them.
So they have the ability to create, read, update and delete beneficiaries, families and incidents. But they can not edit the granting status of an incident
###Accountant
Accountants can edit Benefits and have full management right to incidents. It's their task to administrate the granting status of an incident.
###Supporter
Supporters can read everything except application settings (Roles, DonorTypes, Users)
###Sharana_France
As a special version of a supporter, they can **only** manage their own supporter, (with DonorTypeId == 1)

Contribute
----------

- Issue Tracker: [github.com/yannickschuchmann/mamadata/issues](https://github.com/yannickschuchmann/mamadata/issues)
- Source Code: [github.com/yannickschuchmann/mamadata](https://github.com/yannickschuchmann/mamadata)

Support
-------

If you are having issues, please tell us.
