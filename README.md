# ClearScore app test

Create an app following instructions in ClearScore documents.

## Technical decisions made

- This project is written with SwiftUI and combine
- We decided to add a `main` menu with 2 links :
    * Home
    * Details
    
    This menu is mostly hidden and when the app starts it takes you immediately to home but this menu can be open via the button on the top right using a a larger device (iPad or iPhone in landscape)
    
- In Home screen, we added animation:
    * Spin the circle once while filling the circle based on the (score / max score) inside the API response under credit report info
- In Home screen, when you click on the circle
    * Opens the details screen
    * Details screen can also be open when opening the hidden menu (depends on screen size) and clicking on the detail link
- In the Details screen:
    * The `Back` button will open the `Home` screen
    * The list inside the details screen is dependent on the data the API returned, if a variable is missing - it will not be shown in the list
    * The details screen has 2 more links for `credit report info` and `coaching summary`: This will open the respective screens
- App localization added for english only, new languages can be added easily in the Localizable string file
 
## Testing

- Full testing suite at 97% tested.
- We have unit test at 48%
    
## Notes

- The Code has comments on the top of each file and some comments where i thought necessary 
