Protocol
========

A guide for getting things done.

Create Rails app
----------------

* Create a rails project locally

    rails new dummy

* Create a github repo on http://github.com/new and follow the instructions to add
your code to the repo. Create the repo on the groupbuddies organizations. Create
the repo on the groupbuddies organization.

* Create a `dev` branch.

* Create a `bin/setup` script that sets up everything required to start using
the app.

Set up Rails app
----------------

Set up the app's dependencies.

    cd dummy
    bin/setup

Write a feature
---------------

Create a local feature branch based off dev.

    git checkout dev
    git fetch
    git rebase
    git checkout -b <branch-name>

Prefix the branch name with your initials. If pairing follow [this
guides](http://robots.thoughtbot.com/how-to-create-github-avatars-for-pairs).

Rebase frequently to incorporate upstream changes.

    git fetch origin
    git rebase origin/dev
    <resolve conflicts>

When feature is complete and tests pass, stage the changes.

    bundle exec rspec && bundle exec cucumber
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

Submit a [Github pull request](http://goo.gl/Kmdee) or if you have permission
to, merge immediately (not advised).

Review code
-----------

Team member(s) other than the author reviews the pull request. They follow
[Code Review](../code-review) guidelines to avoid
miscommunication.

They make comments and ask questions directly on lines of code in the Github
web interface.

For changes which they can make themselves, they check out the branch.

    git checkout <branch-name>
    bin/setup
    bundle exec rspec && bundle exec cucumber
    git diff staging/dev..HEAD

They make small changes right in the branch, test the feature in browser,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

Merge
-----

Rebase interactively or merge (follow what the project team is doing). Squash
commits like "Fix whitespace" into one or a small number of valuable commit(s).
Edit commit messages to reveal intent.

    git fetch origin
    git merge origin/dev // or git rebase -i origin/dev
    bundle exec rspec && bundle exec cucumber

View a list of new commits. View changed files. Merge branch into dev.

    git log origin/dev..<branch>
    git diff --stat origin/dev
    git checkout dev
    git merge <branch> --ff-only
    git push

Delete your remote feature branch.

    git push origin :<branch-name>

Delete your local feature branch.

    git branch --delete <branch-name>

Deploy
------

Use the Semaphoreapp on-click deploy button, if it is set up. Alternatively, run:

    bundle exec cap [production|staging] deploy

Make sure everything's ok. Sometimes you'll need to manually restart services.

Communication
-------------

* Prefer face to face communication.
* Use Hipchat to communicate when the person(s) is unavailable or the discussion
can be asynchronous.

### Hipchat

There is a room for each project, one for management (50th Floor), one for
generic talk of the company's policies (Group Buddies), one for generic talk on
the main topics of interest of the company (Development, Design, DevOps), one
for CI info (CI), one for any errors that occur on the apps (Exceptions) and one
for random talk (Danger Room).

* Use the room for the project you want to talk about.
* Use the room for the generic topic if it does not apply to a specific project.
* Avoid using private or 1-1 rooms. If you're having a discussion about a
project maybe someone else can pitch in or at least read it, if not use the
Danger Room. If the conversation does not fit any of the rooms, question
yourself if you should be having it on the company's Hipchat.
* Avoid tagging people.
* Prefer using `@all`, which applies only to the people already on a room.

