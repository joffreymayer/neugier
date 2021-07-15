## Github: 
	
- pull request = "Take some changes from a particular branch and bring it into another branch."
	- <ins>Achtung</ins>: es ist eine *Request*, es wurde noch nichts gemerged! Für das brauch es noch `merge` als zusätzlichen Befehl. 		
- <ins>fork a repo</ins>: Take someone else's repo - because you love it 😊  - and put it into your own list of repos, in order to be able to edit it yourself without affectig the original repository of the owner.
				
> How to tell the original owner you want to merge <ins>your</ins> changes that you made back into their orignal repo and implement them those changes into their original work // repo?
				
Look at [the youtube video from Coding Train ab 9:35-11:50](https://www.youtube.com/watch?v=_NrSWLQsDL4&list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV&index=3)
  - To see how to **refer** to issues & bugs in your code <ins>directly</ins> via your commit-command, [look at the youtube video ab 6:35-7:40](https://www.youtube.com/watch?v=WMykv2ZMyEQ&list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV&index=4) and to <u>diretly</u> **close** issues, because you resolved it, look [look at the youtube video ab 7:40-8:55](https://www.youtube.com/watch?v=WMykv2ZMyEQ&list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV&index=4).

> What is a remote?

A remote is a **duplicate instance of your repository (on your local computer)** that lives somewhere else on a remote server (like Github).
		
    
## Terminal Commands (in Mac):
	
- `clear` = clears the terminal
- `cd` = change directory
  - `cd ..` = go back one directory
- `pwd` = print working directory
- `ls` = prints all the `child-directories` (= one layer deeper of the path) from the `parent-directory` (= current directory you are in with your terminal) you are currently in.
  - `dir` = this is the same command as `ls` but `dir` is for `Windows`.
- `pwd` = print working directory
- `open .` = opens the current directory you are in
- `commit` = save
- `hash` = unique identifier in the history of files (--> it is a huge string composed of characters (= Buchstaben) & numbers) 
- <ins>Trick #1</ins>: hit the "Tab-Taste" == will automatically auto-fill the name of the file / directories etc.
  - <ins>Example</ins>: Type `cd Dok` + "Tab"-Taste --> *auto-fill activates* --> im Terminal steht dann der automatisch ausgefüllte Name des Files / Directories, zum Beispiel `cd Dokumente` bzw. `cd Name_Of_Child_Directory` 
- <ins>Trick #2</ins>: How to find a path of a directory that is situated very deeply in your local computer?
  - <ins>Example</ins>: Type `cd ` + drag-&-drop the **folder** that is deep in your computer with the file in it.
				
## Specific Git Commands <u>within the Terminal</u> on your local computer: getting started for the first time
	
- `git config --list` = Sehr wichtig, **wenn du `Git` zum ersten Mal via einem neuen Computer runst**! Dieser Befehl zeigt dir, welchen Username & Email du aktuell  verwendest (schaue bei `user.name` & `user.email`, ob es deine Github Anmelde-Daten sind). Es ist key - **insbesondere, wenn du neu mit Git beginnst** - dass diese  Parameter mit deinen Github Anmelde-Daten übereinstimmen! Ansonsten musst du immer `git clone` machen und die ältere Version in einen "alt"-Ordner tun, was extrem mühsam ist. 
  - Wenn du noch keinen `user.name` hast, dann gebe folgenden Code in die Command-Line ein: `git config --global user.name 'Dein_Github_UserName'`.
	  - <ins>Beachte</ins>: Schreibe den Namen <ins>**mit**</ins> die Anführungszeichen!
  - Wenn du noch keinen `user.name` hast, dann gebe folgenden Code in die Command-Line ein: `git config --global user.name 'deineEmail@email.ch'`.
	  - <ins>Beachte</ins>: Schreibe die Email <ins>**ohne**</ins> die Anführungszeichen!
  - <ins>Check if it worked</ins>?: Gebe wieder den Befehl `git config --list` und schaue bei `user.name` & `user.email`, ob dort deine Github Anmelde-Daten übernommen wurden.
	
- `git push` = this is the act of sending to `Github`.
- `git pull` = this is the act of receiving from `Github`.

### Key concept in Git

Before starting to work with `Git`, you need to understand that there are 2 ways of starting a project:

```
1) Create a `remote` repository on Github and then `cloning` it - via Git - on your local computer to work from there.
2) Creating a repository `locally` on your computer and then - aftre a few months working on this repository - adding it to Github.
```

*Depending on which of those 2 different ways you choose to start a project (create a repo right from the get-go on `Github` VS. work locally and then - after some time - push everything to `Github`), the Git-Commands will slightly differ.*
		
> What are the Git-Commands, if you start your project directly by creating a Repo on Github (= *possibility 1*) above)? 
		
- `git clone https://github.com/joffreymayer/tageb.git` == Will clone your <u>remote</u> directory `tageb` - which is currently on Github on your <u>local</u> computer, which is simpler // more comfy when working on projects =)
- `git status` = Assume that you worked on & modified a file on your local computer that you previously had on Github (you cloned the directory with the file in it on your local computer). With the command `git status`, `Git` will check whether there is any changes between your local files VS. the files in the remote directory on the Github-Server // -Website.
- <a name="anchor-1">`git commit -a -m "Test comment for a commit"`</a> = If you changed a file locally and you are happy with your results, you will need to make a `commit` (= save) <ins>and</ins> `add` all files (= this is why we have an input // argument `-a`; the concept of `adding` will be explored in the chapter below, where you want to put a local repo into Github after a few months) and you also want to document, what exactly you modified, if you need to go back to a previous version of your file (= this is why we have an input // argument `-m "comment is here..."`).
- `git push origin master` = If you have done some changes locally on your file, you can now `push` everything on the Github-Website.
- `git log` = see, locally, the history of your `git commit`s.
	- <ins>Achtung</ins>: When running this command, you might - accidentally - run into a dangerous environment called `VIM`, which is a terminal-based text-editor. The problem when you are in `VIM`, is that you might not be able to get out of it. 
		-<ins>Solution</ins>: To get out of `VIM`, just type in `:q` and you will get out of it.
- `git remote -v` = This will tell you which URL is the `remote` on which your repository is hosted.
	- <ins>Merke</ins>: The URL of your repo is *assigned* to the variable `origin` in `Git`.
		
> What commands do you need, when you decide - after a few months working <u>locally</u> on your computer - to put everything on Github (= *possibility 2*)?
		
- `git init` == To get started, you need to go to your repository with your terminal - e.g. set the working directory with `cd Joffrey\dokumente\my_project`) first - and, then, transform your repository to a *Git-Repository* by just typing `git init` into your terminal.
- `git add single_file.txt` == *After* you initialized your repository, you will have an **empty git-repository**. `Git` will <u>not</u> `track` the files in your repository (= `untracked files`), unless you explicitly point them out via the `git add` command.
	- <ins>If you want to add all files quickly // simultanoeusly</ins>: `git add .`
	- <ins>Für genauere Theorie // Erklärung dahinter</ins>: Siehe Youtube-Video Coding Train ab [2:10-6:03](https://www.youtube.com/watch?v=9p2d-CuVlgc&list=PLRqwX-V7Uu6ZF9C0YMKuns9sLDzK6zoiV&index=7)
- `git commit -m "Adding a new comment for my commit"`: *After* having pointed out to `Git`, which files he needs to track, you can do a `commit` of the changes of the files you modified, like in *possibility 1)*. 
	- <ins>Achtung, es gibt einen kleinen Unterschied zu *possibility 1)*</ins>: das `-a` ([siehe oben](#anchor-1)) ist verschwunden, weil wir hier `add` und `commit` als zwei separate Schritte betrachten.
- `git remote add origin https://github.com/joffreymayer/new-repo` = Because our repository is still currently not on `Github`, we <ins>first</ins> need to [go on the Github Website](https://github.com/joffreymayer?tab=repositories) and create an <u>empty</u> repository. *After* having done this, you need to tell `Git` - with the command `git remote add origin` + **copy-pasting the URL** "https://github.com/joffreymayer/new-repo" - that this is our local 
	- <ins>Check if it worked</ins>: Type the following into the Terminal `git remote -v`. It should output the variable name - usually called `origin` - 
		- <ins>Note if you want to be fancy</ins>: Within `git remote add origin`, the name `origin` can be changed to any word you like. This is just the variable name in which your Github-URL will be stored.
	- If there is already a remote with the default name `origin` but you don't like the name, you can change the name by: 
		1) `git remote remove origin` --> this will delete the remote
		2) `git remote -v` --> just to check if step 1) worked --> should not output anything
		3) `git remote add noob https:\\github.com\project-1` --> now, re-name the remote and call it `noob` 
- `git push origin master` == *Finally*, you will be able to put all your files into the freshly made remote-repository on `Github`.
- `git pull origin master` == Assume that you did changes `remotly` on Github but not yet locally on your computer. This does not matter, since you can just enter the command `git pull origin master` to be able to retrieve the changes that you did `remotly` on Github onto your local computer =)
		
> Tutorial for branches?

Look at [youtube-videos from Coding Train](https://youtu.be/oPpnCh7InLY).
		
- `git branch new_branch` == this will create a branch locally on your computer
- `git checkout new_branch` == this will tell `Git`: "ah, he wants to go into the branch called 'new_branch'".
- `git branch` == this will give you a list of all the branches you ave created locally. Furthermore, it will tell you on which branch you currently work on.

> How to merge the changes you made on a separate branch to the `master-branch` (= main branch)?
		
1) `git branch new_branch` == this will **create a branch** called `new_branch` locally on your computer.
2) `git checkout new_branch` == You will tell `Git`: "I now want to **work on this newly created branch** called 'new_branch'".
3) `git checkout master` == *After* you are happy with the changes you did in `new_branch` you will need to prepare for the merging by **switching to your main-branch**, which is the `master`-branch.
4) `git merge new_branch` == Since you currently are in the `master-branch`, Git will know that you want to **merge** `new_branch` <u>into</u> the `master-branch`.
		
That was it 😎