# CraterVar

### App - [CraterVar](cratervar.com) (this site)

### Repo - [CraterVar](https://github.com/outbaksean/homepage)

---

### CraterVar

CraterVar is the site you're looking at. It's my somewhat over engineered personal site where I plan to put my project links and descriptions along with some writing maybe.

The name CraterVar comes from a Dungeons and Dragons character I enjoyed playing.

### Architecture

The over engineered is mainly in the infra, the site itself is a fairly basic vue3 application.

Infra

- Domain and DNS with AWS Route53
- CDN with AWS CloudFront
- Vue code published to S3

Deploy

- Infra deployed by terraform run locally, all terraform is in the repo
- App changes are deployed by github actions, any pr merged to main with changes in the app/ directory triggers a `npm run build` and an S3 sync of the output followed by invalidation of the CloudFront distribution.

SDLC

- This is a solo project but I'm trying to use processes similar to a work environment since I am a professional.
- Pushing to main is blocked
- Changes are made in a feature branch, a GitHub action does `npm run build` when a pr is made and prevents merging on failure.

Website

- No backend, I don't expect this to change, projects with backends may be embedded but will not be part of this repo
- Vue3 with Vite
- I'm using the "marked" package to convert md files into html
- I'm heavily using AI for coding, I'm not using it for writing. I'm currently using Claude Code.
