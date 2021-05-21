# .dotfiles for Absolute Beginners

#### *Backstory*

When I'd been a developer for about 6 months (just long enough to have a decent amount of configuration going on in my .bash_profile but not long enough to *really* understand what all of it did or how it even got there) my computer battery nearly exploded and melted my computer a little.  *It's fine*, I told myself.  *Everything is backed up in GitHub*.  Well, almost everything.  I lost all of the configuration in my .bash_profile (well in my .bashrc actually, here is a [nifty explanation](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html) for why you might want to use .bashrc instead of .bash_profile and how to make sure your .bash_profile loads your .bashrc.) plus some great scripts I'd forked, modified, and subsequently not committed to git or pushed to github.  Oh and the global gitignore file that I had painstakingly curated.  I was devastated.  I spent nearly a week without a computer while I tried to decide what I wanted to replace my old computer with (I was unprepared for such a major decision) and then I spent days reinstalling apps and trying to remember all the things that were in my old config files, all the while complaining about how much I hate new electronics because I hate change.  A friend laughed at me.  She said getting a new computer was supposed to be fun.  I wasn't having any fun though because I lost almost two weeks by the time the new computer was up and running *and it still* wasn't the same.  It could do all the things the old machine could (and much faster I might add) but no matter how I tried, I couldn't get my prompt quite right.  I knew there had to be a better way.  

It could have been as simple as copying my .bash_profile minus the secrets into a text file and adding that to github or my dropbox.  But in the end I'd have to remember to update the backup file every time I made a change and relying on that didn't seem to be such a great idea.  So, I did what any good developer does and Googled it, stumbling into the crazy complicated world of dotfiles.  At first I was put off.  Enthusiasts encouraged you to fork their repositories and run their install scripts (with the warnings that you should do so **only if** you understood what all the code did.  Instructions told you how to automate a complete computer set up by running a single command. It seemed like overkill for what I wanted to do (namely backup my bash profile and my gitignore) but the internet agreed: dotfiles were the way to go.  Motivated by all the work I'd just put in to switch computers, I decided to wade in headlong and figure out the best dotfile configuration for me.  

When I started a new job and was given a brand new development machine, I reaped the complete benefits of the dotfiles for the first time.  It took me less than a day to get everything configured - my computer happily configuring itself while I attended meeting after meeting, needing only minimal supervision from me.  But I quickly realized that I needed different things at home than I did at work, so I decided to make a branch called work that represents the dev setup for my work laptop.  I can customize the scripts without worrying about how it might impact my home system.  

Below is my journey from my very first dotfile, outlined from the smallest initial step of using the bash_profile in my dotfiles directory (committed to git and pushed to github), growing incrementally in complexity as my dotfiles configuration becomes more complicated.  It is a work in progress updated every time I update my dotfiles.  

Feel free to fork my .dotfiles (after all, [they are meant to be forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) - or [maybe not](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)) and read on.  Here you will find the guide that I wish I would have had when I started.  

## Making Dotfiles

Why shouldn't you just fork a repo, run the installation, and enjoy the fruits of someone else's dotfiles?  There are two reasons.  First, running a script you don't understand could have unintended consequences for your computer (and maybe you won't be able to get back your previous configuration) even if the developer has the best of intentions.  You could also be exposing your computer to malicious scripts and we all know why that is a bad idea.  Second, you should customize dotfiles to your specific needs.  It's fun to see what other people are doing, but in the end you should do what works for you.  

### The Simplest Step

I can't tell you how many times when I was learning Ruby (my very first programming language), my instructors told me to always start with the smallest possible thing.  I decided to take the approach to my dotfiles.  The myriad of dotfiles repositories contain installer scripts that can be run to automate backing up old config files and creating symlinks to the new files in the repositories.  While I'm sure that's where I will end up, I wanted to start smaller.  My first step was to commit a bash_profile inside my dotfiles respository and then link to it (using a symlink).  I created the dotfiles directory, created a file inside of it called bash_profile, and copied the current contents of the .bash_profile in my home directory to the new bash_profile in the dotfiles directory and committed it to git.  Then I created a symlink in the home directory to the right file:

```
ln -s ~/dotfiles/bash_profile ~/.bash_profile
```

Notice that my dotfiles repository is not hidden (it's not a dotfile itself).  You can choose to make it hidden or not, that decision is entirely up to you, but make sure to check to make sure that your repository is named correctly in the ln command or your link won't work.  Run ```source ~/.bash_profile``` to make sure it's working.  

My next step was to do the same for my .bashrc (skip this step if you only use a .bash_profile).  Then I created another symlink for the .bashrc:

Voila just like that I had completed my initial mission: backup my .bash_profile.  Drunk with my newfound power I did the same thing for my .gitignore_global and .gitconfig files.  

### Sourcing other files in bashrc

The next step was to move my aliases out of my bashrc to their own file and source that file at the top of the bashrc.  Why bother moving them?  I called the new file bash_aliases and moved all of my aliases (including those that are for git and github) into the file.  There are other ways to organize the files of course.  Some people use a git specific directory for their git configurations (like gitconfig and gitignore_global).  At this stage, I don't really have enough of anything to justify having all of those different files and directories so for now, I'm going to stick with only one alias file.  I can always change it later.  To source the alias file I put this line at the top of my bashrc:

```
source ~/dotfiles/bash_aliases
```

I also moved my prompt to a bash_prompt file and sourced it in bashrc.  Make sure to provide a complete file path for your file.  sourcing only the filename within the same directory might appear to be working, you'll get error messages when you open new terminal windows.  

### Making a setup script

I already had a list of programming languages to install and a bunch of notes reminding me how to find them.  I decided that I would convert my notes to a script to further automate the process of setting up a new machine.  I created a setup.sh file that installed Homebrew and quickly made all the simlinks I outlined above.  I still needed to run the file manually, but when it was done, Homebrew and Homebrew Cask were installed and everything was linked properly in one easy command.     

### Other installation scripts

I also needed to install programming languages like Ruby and Java, plus all the applications that I used on a daily basis.  While not everything that I use all the time is available in Homebrew Cask, enough of them are to justify running scripts for installing everyday applications and the applications for my development environment.  The earliest incarnation of these scripts included only basic logging (echo "installing google-chrome") and commands to install the apps using Homebrew Cask, but a later refactor put all the apps into an array and looped over each item, logging that it was installing and running the install command.  To test the refactor, I changed ```brew cask install``` to ```brew cask search```.  

## My Setup

dotfiles
  bash_profile
  bashrc
  bash_prompt
  bash_aliases
  gitignore_global
  gitconfig
  setup.sh
  languages.sh
  appinstaller.sh
  developmentenv.sh

## Resources

This section contains all of the links I consulted along the way, for my reference and yours.

I started here (http://dotfiles.github.io/)

https://github.com/webpro/awesome-dotfiles

https://blog.kalis.me/dotfiles-automating-macos-system-configuration/

http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

https://mattstauffer.com/blog/setting-up-a-new-os-x-development-machine-part-3-dotfiles-rc-files-and-ssh-config/

https://www.geeksforgeeks.org/array-basics-shell-scripting-set-1/

http://www.tldp.org/LDP/abs/html/abs-guide.html
