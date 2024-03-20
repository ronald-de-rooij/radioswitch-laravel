# Naming Conventions

Laravel is used as backend/API framework. Therefore, developers are encouraged to stick to naming conventions used in
Laravels framework as much as possible.

| What          | How             | Good                  |  Bad                                      |
|---------------|-----------------|-----------------------|-------------------------------------------|
| Controller    | singular        | `ArticleController`   | ~~ArticlesController~~                    |
| Model         | singular        | `User`                | ~~Users~~                                 |
| Model property| snake_case      | `$model->created_at`  | ~~$model->createdAt~~                     |
| Variable      | camelCase       | `$articlesWithAuthor` | ~~$articles_with_author~~                 |
| Table         | plural          | `article_comments`    | ~~article_comment~~, ~~articleComments~~  |

For a full list of conventions, check out
the [laravel-best-practices](https://github.com/alexeymezenin/laravel-best-practices#follow-laravel-naming-conventions)
repo.
