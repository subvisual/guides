Git Protocol
============

A guide for programming with version control.

Write a feature
---------------

Create a local feature branch based off dev.

    git checkout dev
    git fetch
    git rebase
    git checkout -b <branch-name>

In case there is not dev branch, do the same for the master branch.

Prefix the branch name with your initials. If pairing follow [this
guide](http://robots.thoughtbot.com/how-to-create-github-avatars-for-pairs).

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

*Remember: Any reference to dev can be changed to master.*

Rebase interactively or merge (follow what the project team is doing). Squash
commits like "Fix whitespace" into one or a small number of valuable commit(s).
Edit commit messages to reveal intent.

    git fetch origin
    git rebase origin/dev // or git rebase -i origin/dev
    bundle exec rspec && bundle exec cucumber

View a list of new commits. View changed files. Merge branch into dev.

    git log origin/dev..<branch>
    git diff --stat origin/dev
    git checkout dev
    git merge --no-ff <branch> // if only 1 commit git merge <branch>
    git push

Delete your remote feature branch.

    git push origin :<branch-name>

Delete your local feature branch.

    git branch --delete <branch-name>

