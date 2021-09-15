# Rules for contributing to this project

When you contribute to this project, please adhere to the following rules.

## Coding standards

[All PHP code (except for the vendor folder) should adhere to PSR-12](https://www.php-fig.org/psr/psr-12/). Please set
up your editor accordingly.

Commits that re-format the code should be separate from commits that alter the code.

### Code conventions

Laravel is used as backend/api framework. Therefore, developers are encouraged to stick to naming conventions used in
Laravels framework as much as possible.

| What          | How             | Good                |  Bad                               |
| -----------   |:---------------| --------------       |  ------------------------          |
| Controller    | singular        | ArticleController   |  ~~ArticlesController~~            |
| Model         | singular        | User                |  ~~Users~~                         |
| Model property| snake_case      | $model->created_at  |  ~~$model->createdAt~~             |
| Variable      | camelCase       | $articlesWithAuthor |  ~~$articles_with_author~~         |
| Table         | plural          | article_comments    |  ~~article_comment~~ ,  ~~articleComments~~   |

For a full list of conventions, checkout
the [laravel-best-practices](https://github.com/alexeymezenin/laravel-best-practices#follow-laravel-naming-conventions)
repo. If you are in doubt at any point, discuss it with the team.

## Gitflow

There are three branches:

- `develop`
- `acceptance`
- `production`

These correspond to the deployment servers.

- `production` is for production use - the real thing.
- `acceptance` is used for demos and showing features to the client.
- `develop` is for local development and the server to show features to the project managers.

The `develop` branch may have some bugs, but the branch should be kept as clean as possible and in working order.
The `acceptance` and `production` branches should deploy and function flawlessly.

## Adding new features

- Ensure your local repository is up to date.
- Create a new branch from `develop`.
  - The name of the branch must adhere to a naming convention, which is `feature/{project-abbreviation}-123-description`
- Make your commits in the branch
  - Commit messages must start with `[{project-abbreviation}-123]`
  - Commit messages must be descriptive and consist of at least 7 characters (so "Fixed!" is not enough).
- Create a Merge Request for the branch on Gitlab
- When your Merge Request is approved, it is *your* responsibility to merge the branch back into `develop`.
- Do *not* perform a squash merge!

## Updating your branch

Since squash merging is not used, it's easy to fold in any updates to `develop` into your own feature branch, which
makes the eventual merging back to `develop` easier.

First, ensure you have no unstaged changes or commits.

- Do `git checkout develop`
- Update it with `git pull --ff-only`
- Then, do `git checkout feature/{project-abbreviation}-123-description` (the branch you need to update)
- Then, do `git merge develop --no-ff`
- Make sure the commit message follows the correct format by doing `git commit --amend`

## Merge to acceptance

At a certain point, `develop` is considered mature to be merged into `acceptance`. When doing this, announce that you
want to proceed with a merge, so that there's a temporary "code freeze".

The same rule holds for merging from `acceptance` to `production`.

## Hotfixes

A Hotfix branch must adhere to a naming convention, which is `hotfix/{project-abbreviation}-123-description`. If the hotfix is urgent,
apply it to `production` first, then apply the changes to `acceptance` and `develop`.
