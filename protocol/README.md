Protocol
========

A guide for getting things done.

Set up laptop
-------------

Set up your laptop with [this script](/groupbuddies/laptop) if you have a mac, otherwise install the specified libraries and 
try to follow the steps.

Create Rails app
----------------

Create a rails project locally

    rails new dummy

Set up Rails app
----------------

Create a github repo on http://github.com/new and follow the instructions to add your code to the repo.

Set up the app's dependencies.

    cd dummy
    bundle --binstubs
    rake db:setup

Write a feature
---------------

Create a local feature branch based off master.

    git checkout master
    git pull --rebase
    git checkout -b your-initials-new-feature

Rebase frequently to incorporate upstream changes.

    git fetch origin
    git rebase origin/master
    <resolve conflicts>

When feature is complete and tests pass, commit the changes.

    rake
    git add -A
    git status
    git commit -v

Write a [good commit message](http://goo.gl/w11us).

    Present-tense summary under 50 characters

    * More information about commit (under 72 characters).
    * More information about commit (under 72 characters).

Share your branch.

    git push origin [branch]

Submit a [Github pull request](http://goo.gl/Kmdee) or if you have permission to merge immediately (not advised).

Review code
-----------

A team member other than the author reviews the pull request.

They make comments and ask questions directly on lines of code in the Github
web interface.

For changes which they can make themselves, they check out the branch.

    git checkout <branch>
    rake db:migrate
    rake
    git diff staging/master..HEAD

They make small changes right in the branch, test the feature in browser,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

Merge
-----

Rebase interactively. Squash commits like "Fix whitespace" into one or a
small number of valuable commit(s). Edit commit messages to reveal intent.

    git rebase -i origin/master
    rake

View a list of new commits. View changed files. Merge branch into master.

    git log origin/master..[branch]
    git diff --stat origin/master
    git checkout master
    git merge [branch] --ff-only
    git push

Delete your remote feature branch.

    git push origin :[branch]

Delete your local feature branch.

    git branch -d [branch]

Deploy
------

Ask the Sys Admin! 
