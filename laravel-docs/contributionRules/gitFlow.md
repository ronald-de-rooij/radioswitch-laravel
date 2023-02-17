# Git Flow

The following approach is used during development of the software.

## Branches

- `main`: Only working, stable code may be submitted for this branch.
- `feature-`branch: Used to develop new features for next/future release. Branched off `main` and merged back into it
  after complete development of the feature. Can be deleted after merging. Use the Jira ticket number to name your
  feature branch.
- `hotfix-`branch: Used to make a quick fix. The naming difference is minimal compared to a feature branch, but still
  useful for traceability.

## Adding New Features

- Ensure your local repository is up to date.
- Create a new branch from `main`.
- The name of the branch must adhere to a naming convention, which is `feature/PROJECT_ABBR-123-description`, where `123`
  is the Jira ticket number.
- Make your commits in the branch
    - Commit messages must start with `[PROJECT_ABBR-123]`
    - Commit messages must be descriptive and consist of at least 7 characters (so "Fixed!" is not enough).
- Create a Merge Request for the branch on Gitlab
- When your Merge Request is approved, it is *your* responsibility to merge the branch back into `main`.
- Do **not** perform a squash merge!

## Updating Your Branch

Since squash merging is not used, it's easy to fold in any updates to `main` into your own feature branch, which makes
the eventual merging back to `main` easier.

- Do `git checkout main`
- Update it with `git pull --ff-only`
- Then, do `git checkout feature/PROJECT_ABBR-123-description` (the branch you need to update)
- Then, do `git merge main --no-ff`
- Make sure the commit message follows the correct format by doing `git commit --amend`

## Git Style Guidelines

For git to really add value to the collaboration on the code it's nice to have some style guidelines for commits and
branches and such, hopefully, this will help the whole process go as smoothly as possible. They should be applicable
about 95% of the time. If in certain situations it's better to deviate from them, let the lead dev know and we can
figure it out.

- Only commit code formatted according to [code style guidelines](/codingStandards). This prevents a
  seemingly large change happening when somebody else's IDE formats the code automatically.
- Avoid commented code lines unless they are for a specific purpose and it's marked clearly in the comments. If you want
  to remove dead code, just remove it outright and make sure it was really dead.
- Don't commit to the `main` branch directly - it's easy to still have a small error somewhere.
- Create a branch for each issue code.
- Refer to the issue code again in the commit messages.
- Make a Pull Request as soon as the code is ready to merge. The branch can stay open after that for more changes if
  needed.
- Make sure to move the status of issues in the issue tracker along with their branches/pull requests.
- If your branch gets old, pull `main` into the branch if necessary. Also check if this is necessary before making a PR,
  as this is the time for the developer of the branch to solve any merge conflicts there may be with the branch in development.
- Be sure to always commit/push to your working branch regardless of the state of the code, so that all changes get
  backed up to the remote server.

## Review

- Check if the Gitlab pipeline succeeds
- Check if the branch is up to date with `main`
- Check if the change implements what it should (i.e. is (all) of the functionality/fix described in the ticket present)
- Check the overall quality (principles of Clean Code)
- Check if there is decent test coverage
- If the change impacts the frontend, also ensure nothing breaks there
- If you find any issues start a discussion on the merge request. If you need input from someone else mention them in
  the discussion. If you're done with a round of reviewing and there are still open discussions assign the ticket back
  to the implementer. The reviewer determines if/when a discussion can be resolved.

