# [OOTP Missions 27](/ootp-missions-27/)

### App - [OOTP Missions 27](/ootp-missions-27/)

### Repo - [ootp-missions-27](https://github.com/outbaksean/ootp-missions-27)

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

### Roadmap

- UI Overhaul, details TBD
- Find a way to more easily update missions and card updates during the seasion
  - Getting mission data programatically has been tried and failed. The data doesn't seem to be saved on a system file and decrypting api requests with WireShark failed
  - The plan is to try to set up OCR for mission data and continue to manually export card shop data
  - Consider crowdsourcing
- There are no plans for a backend since the algorithm changes made it acceptable performance wise to do the calculations in the browser.
