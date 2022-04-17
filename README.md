# UNC Autolink plugin
[日本語](README_Ja.md)

Create link from UNC format strings like outlook automatically when showing textile format field like below.

    \\servername\folder

It is also able to specify UNC format strings contains *spaces* with "<" and ">" brackets.

    <\\servername\folder name1\folder name2>

The specification is almost same as Microsoft Outlook.  
The UNC strings which have already been stored in database will be also shown as link since this plugin works in viewing phase.

## Installation

1. To install the plugin

    `git clone` to `plugins/redmine_unc_autolink` on your Redmine path.

        $ cd {RAILS_ROOT}/plugins
        $ git clone https://github.com/preciousplum/redmine_unc_autolink 

2. Restart Redmine.

    Now you should be able to see the plugin in **Administration > Plugins**.  
    *) Database Migration is **not** required.

## Compatibility
This plugin version is compatible with Redmine 3.4.* or later in principle.  
However, this plugin has been tested on Redmine 4.2.5 only currently.

## Screen Image
![Screen Image](assets/images/screenimage.png)  
