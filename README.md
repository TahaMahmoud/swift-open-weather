# Overview:

Daily forecast application is a simple application consisting of only one screen with a top bar containing a text field accepting the city name then when the user click search app should hit api and get daily forecast data for given city name, and cache it.

Using [Open Weather API](https://openweathermap.org/forecast5)



# Architecture:

This app created using VIPER architecture and it is an application of Clean Architecture. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing (And I use another component called Contrcat). Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers.



# Key Features:

- Zero Pods (I didn't use any library at this app)
- VIPER architecture
- URLSession at Network Layer
- Localization
- CoreData as Local DB
- Caching at UserDefaults
- Some extensions
- Xib for UI



# App Structure:

- Core
-- App
-- Local
-- Network
-- Repos

- Extenions
-- Foundation
-- UIKit

- Modules
-- Base
-- Main

- Resources

- Utilities
-- Global
-- ReusableViews
--- Alert
--- NavBar
--- LoadingController
-- Localization



# Author:

Created by Mohamed Elbana on 2021.
[LinkedIn](https://www.linkedin.com/in/mohamed-elbana-a5a214ab)


Please don't hesitate to ask any clarifying questions about the project if you have any.

