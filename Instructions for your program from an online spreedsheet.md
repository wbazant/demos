
## Instructions for your program from an online spreadsheet
Suppose you're a programmer contracting for a client who pays you to do analyses on a bunch of data. They give you a slightly different spreadsheet every week, and you're so lazy that you've scripted everything up. The only thing you need to do is take that spreadsheet, save it on disk or whatever, and press "run".

Here's an idea for a workflow that goes one step further, using GitHub's online editing. Of course GitHub's competition offers this too, and I dislike this Microsoft owned company as much as is currently in fashion.

### Why spreadsheets?
People like to edit data in spreadsheets. It's easier to spot inconsistencies, process entries row by row, and the software offers a lot of techniques with facilitating mundane stuff like filling in the same value lots of times.

Spreadsheets capture data pretty well. Data is frequently not column-shaped but tree-shaped, with objects nested inside one another, but every tree is a table if you de-normalize it: this is a minor fact of mathematics. There's not much schema or validation in spreadsheets, but people can just try hard to not make typos and they are frequently very good at it.

### Requirements
Your client needs:
- a GitHub account
- their own version of a spreadsheet
- copy-paste ability
- desire to follow instructions on a weird programmer site
You need:
- a GitHub account
- a repository
- a continuously integrated way to check incoming spreadsheets
- somewhere to continuously deploy that repository

### Workflow
#### Client edits spreadsheet
Your client has a spreadsheet, maybe in Excel or Google Sheets. You train them to copy from that spreadsheet into the clipboard, maybe with shortcuts. This works because these spreadsheet software and operating systems are maintained by big companies that have many enterprise developers making sure people can copy-paste and conveniently select text across all the different computers and browsers.

#### Client accessing Github's "online edit"
Then the client needs to log into GitHub, find a file, and "online edit" it. This has potential to be unfamiliar and confusing - they need to be logged in, navigate to the right file, and do an "edit" on it in an unfamiliar, foreign-looking user interface for programmers. 

#### Client makes an edit
The file pops up for editing, with the previous version that needs to be pasted over, and then the client needs to make a pull request.

There's a number of GitHub's tiny features sweetening this up:
- a file with a `.tsv` extension gets displayed as a HTML table
- programmer words like "pull request" are all explained and not really necessary, and the call to action is "Propose file changes" which is clear enough
- "Preview changes" lets people look at line-by-line diffs, something I personally struggle to edit text without but the norm is to probably read the whole thing again

#### Client submits a pull request
Proposing file changes does a fork to client's repository, fills out the pull request template, and takes them to the PR page with everything set up correctly, so that they can just click through. You can provide a template there if it helps.

#### Client watches pull request get processed
You can then run arbitrary code while the client waits, with nice UI on the PR page that says "wait", "good", or "not good".

#### You merge the pull request
 Merging on successful build is a tedious job programmers are burdened with, and as such it already got solved. [Here's one solution](https://stackoverflow.com/questions/40391344/automatically-merge-verified-and-tested-github-pull-requests) and if it doesn't work well enough I bet you can use a search engine yourself.

#### You run the code on a new spreadsheet
This would probably run on a server you control - again it's completely standard. Have a job that polls the repository, does the work, and tells the client their stuff is ready.

### Case study in data curation
I hope you were impressed by the earlier bit about how people prefer edit spreadsheets but the nature of data is frequently not tabular. It's not mine, I picked it up as digest from a discussion in [model organism community](https://www.alliancegenome.org/) in life sciences. Running these portals depends on work of curators: scientifically trained data entry people who can e.g. extract information from publications and store it somewhere.


