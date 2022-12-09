# vimwiki_in_git
:git:vimwiki:

# Setup
It took a bit of work to get this working, but I think we're there now. EDIT: I abandoned the .wiki version in favor of vanilla .git . It's much easier, and I can use folders.

Steps to reproduce:

- Make a new repo (this is probably optional, could have just used my "life" repo, but repos are free. :)
- Get GitHub Pro with my student ID (wiki's are a Pro-only feature)
- Navigate to the "wiki" tab on the website
- Click into any of the pages, then "clone this wiki locally" (will have a link something like https://github.com/cbeauhilton/vimwiki.wiki.git - I converted this to an SSH format so I could use my key: git@github.com:/cbeauhilton/vimwiki.wiki.git )
- Git clone git@github.com:/cbeauhilton/vimwiki.wiki.git
- Either start writing from here, or copy in the old vimwiki contents (e.g. cp -a vimwiki/. vimwiki.wiki/ )
- Git add/commit/push
- Check it out on GitHub!

The tutorial found here is very good, and I used most of its steps, subbing in GitHub for GitLab: https://opensource.com/article/18/6/vimwiki-gitlab-notes

# Organization
I tried to put things into folders to make the directory cleaner, but that borked the compatibility with GitHub (it could probably be worked out, but...). It seems that the best way to keep this organized and compatible with GH is to keep the structure flat, then make the index.md collapsible and well organized visually. On GH, the "pages" page will be essentially useless, but accessing the index will show a pretty and well-organized page. If I decide to sidestep GH at some point, I could pretty easily go back to folders.

EDIT: Using the .wiki style ended up being a pain, and the links in a normal GitHub repo work just fine.
Sun 17 Nov 2019 10:23:05 AM CST
