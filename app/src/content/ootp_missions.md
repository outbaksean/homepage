# OOTP Missions [Mission Calculator](https://outbaksean.github.io/ootp-missions-2/)

### Repo - [ootp-missions-2](https://github.com/outbaksean/ootp-missions-2)

---

### OOTP

Out of the Park is a baseball simulation game with a Perfect Team game mode similar to Madden Ultimate where you collect cards. There's a new version every year, the current version is OOTP 26, OOTP 27 releases March 13.

### Mission Calculator

The mission calculator is a web app that lets you import your player and shop data exported from the game and tells you the most price effective way to complete missions. It's currently a static site hosted on GitHub Pages

## Upcoming changes

### New Version OOTP Missions 27

- Host in AWS instead of GitHub Pages
- Have a backend
  - Improve performance of calculating missions
  - Reduce amount of data that needs to be imported by the user
  - API Gateway or ALB, Lambda or ECS, DynamoDB
- Styling cleanup
- Find a better way to add new missions and cards as the season goes on
  - Programattically getting mission data from either local files or api calls has hit a dead end
  - Look into OCR to get mission data
  - Consider crowdsourcing or something like 5er
