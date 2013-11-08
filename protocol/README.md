Protocol
========

A guide for getting things done.

Create Rails app
----------------

Create a rails project locally

    rails new dummy

Set up Rails app
----------------

Create a github repo on http://github.com/new and follow the instructions to add your code to the repo.
Create a `dev` branch

Set up the app's dependencies.

    cd dummy
    bundle --binstubs
    rake db:setup

Write a feature
---------------

Create a local feature branch based off dev.

    git checkout dev
    git fetch
    git rebase
    git checkout -b <branch-name>

Prefix the branch name with your initials.

Rebase frequently to incorporate upstream changes.

    git fetch origin
    git rebase origin/dev
    <resolve conflicts>

When feature is complete and tests pass, stage the changes.

    rake
    git add --all

When you've staged the changes, commit them.

    git status
    git commit --verbose

Write a [good commit message]. Example format:

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

    http:://project.management-system.com/ticket/123

Share your branch.

    git push origin <branch-name>

Submit a [GitHub pull request].

Submit a [Github pull request](http://goo.gl/Kmdee) or if you have permission to, merge immediately (not advised).

Review code
-----------

Team member(s) other than the author reviews the pull request. They follow
[Code Review](../code-review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the Github
web interface.

For changes which they can make themselves, they check out the branch.

    git checkout <branch-name>
    rake db:migrate
    rake
    git diff staging/dev..HEAD

They make small changes right in the branch, test the feature in browser,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

Merge
-----

Rebase interactively. Squash commits like "Fix whitespace" into one or a
small number of valuable commit(s). Edit commit messages to reveal intent.

    git fetch origin
    git rebase -i origin/dev
    rake

View a list of new commits. View changed files. Merge branch into dev.

    git log origin/dev..<branch>
    git diff --stat origin/dev
    git checkout dev
    git merge <branch> --ff-only
    git push

Delete your remote feature branch.

    git push origin --delete <branch-name>

Delete your local feature branch.

    git branch --delete <branch-name>

Deploy
------

Use the Semaphoreapp on-click deploy button, if it is setup. Alternatively, run:

    bundle exec cap [production|staging] deploy

Make sure everything's ok. Sometimes you'll need to manually restart services.
