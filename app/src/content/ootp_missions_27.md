# [OOTP Missions 27](/ootp-missions-27/)

### App - [OOTP Missions 27](/ootp-missions-27/)

### Repo - [ootp-missions-27](https://github.com/outbaksean/ootp-missions-27)

---

### Known Bugs

- Unlocked Card Price is not calculated correctly, it's including all unlocked cards not just what's needed for the mission
- Recalculating a mission after overriding price undoes other calculations
- Some missions have bad detail layout

### Working Notes

- Cleanup warnings and tests
- Plan for OCR to get mission data
- Start on new features (listed below)

---

### OOTP

Out of the Park is a baseball simulation game with a Perfect Team game mode similar to Madden Ultimate where you collect cards. There's a new version every year, the current version is OOTP 26, OOTP 27 releases March 13.

### Mission Calculator

The mission calculator is a web app that lets you import your player and shop data exported from the game and tells you the most price effective way to complete missions. This is based off of the ootp-missions-2 project for ootp26 which is archived.

### Current Status

- Deployed OOTP Missions 27 to CraterVar, OOTP Missions 2 (for ootp26) is in archive mode on GitHub Pages
- Currently using OOTP 26 data with plans to migrate to OOTP 27 missions and cards on or near release date
- Updated mission calculation algorithm for a major performance boost, removed greedy mode toggle
- Added Mission Search
- UI Overhaul Done
- Import flow updated/fixed
- General performance improvements
- Added the ability to override card prices and lock status
- Displays mission reward value and net mission value

### In Season Updates

- When cards or updated or added I need to manually export card data from the game and import into the app, this will take well under an hour but requires manual work
- Currently any new missions need to be added manually and can take several hours depending on the amount of missions
  - Getting mission data programatically has been tried and failed. The data doesn't seem to be saved on a system file and decrypting api requests with WireShark failed
  - I'm going to look into using OCR to get mission data

### Potential New Features

- Allow selecting owned cards in the ui
- Calculate Pack EV
