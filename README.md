Group Project - README Template
===

# MenuMyWay

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app where people can search for different menus from a variety of restaurants and be able to translate the menus to different langugages.

### App Evaluation
Evaluation of your app across the following attributes
- **Category:** food and education
- **Mobile:** Use Camera to take pictures of menu items
- **Story:** We want the user to be able to search for different menus and translate them to their desired language, the user will also be able to take a picture of an actual menu and translate the text from the image
- **Market:** Adults
- **Habit:** Daily
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User is able to successfully sign up
* User is able to successfully log in
* User can search for a menu
* User chooses the desired language for the menu that was searched
* User can take an image of a menu
* User chooses the desired language for the menu in the picture
* User is able to successfully log out



**Optional Nice-to-have Stories**

* implement multiple langugages
* Add a save feature for menus
* price range search


### 2. Screen Archetypes

* list first screen here
   * launch screen
   
* list second screen here
   * signup and lognin screen

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Search
* Capture Menu
* Current Menu

**Flow Navigation** (Screen to Screen)

* Launch screen
   * Then that takes you to the login and signup screen
* Home Screen
   * Have options of where to go search or capture an image
 * Search Screen
   * include a search bar
   * Have options of what languages they can translate to
 * Image CaptureScreen
    * Have options of what languages they can translate to
 * Current Menu
    * Show the current translated menu
    * Have options to change the language of the menu


## Wireframes
<a href="https://ibb.co/tCFV5qb"><img src="https://i.ibb.co/mzgf79H/Screen-Shot-2019-04-02-at-10-54-06-AM.png" alt="WireFrames" border="0"></a>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
| Property       | Type          | Description |
| ------------- |:-------------:| -----:|
| Username    | string | unique id for user |
| Password    | string     |  unique password for user |
| email       | string     |    unique email for user |
### Networking

* Login Screen 
  * (Read/GET) Query logged in user object
> if user wants to login check username and password
check if their unique ids match grant access to them
else promt error and ask them to sing up 
* sign up Screen
  * (Read/GET) Query sign up in user object 
> if cant find username then sign up and make a new account
* search Screen
  * (Read/GET) Query selected menu 
> if menu is found then display to user

## Sprint 1
- [x] User can take a photo
- [x] Text is retrieved from the selected photo
- [x] Text is translated to selected language

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/Vzw2HOIALQ8wOU07OB/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Sprint 2
- [x] User can create an account
- [x] User can login and logout
- [ ] User can search for a menu

<img src='https://media.giphy.com/media/RiWnjc1EXXbY7l6IRb/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://media.giphy.com/media/iI4JDhZcIPqIzehXYi/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Sprint 3
- [x] User can't login with invalid credentials
- [ ] User can exchange their currency

<img src='https://media.giphy.com/media/RiWnjc1EXXbY7l6IRb/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://media.giphy.com/media/iI4JDhZcIPqIzehXYi/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />




