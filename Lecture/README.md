<h1 style="text-align:center">Julia Lecture</h1>
<h4 style="text-align:center">- Setting Environment</h4>
<p style="text-align:right"><b>Tae Geun Kim</b></p>

## 1. Install necessary programs

* Julia ver 0.6.0 or Julia Pro
* Git
* VS Code

## 2. Create Github account

1. Go to https://github.com/
2. Create account
3. New repository - JuliaTutorial

## 3. Git Setting

1. Go to Folder
2. `git init`
3. `git config --global user.name [name]`
4. `git config --global user.email [email]`
5. `git remote add [alias] https://github.com/[name]/[repository]`

## 4. Using Git

1. `git pull [alias] master`
2. `git add .`
3. `git commit -am "[Log Message]"`
4. `git push [alias] master`

## 3,4 or Using VS Code

* Just Click. Then Finish

## 5. Using VS Code

* Ctrl + ` = Open Terminal
* Add Julia extension
* Customize your theme or setting file in settings
    > "julia.executablePath": "/usr/bin/julia",  
    > "editor.fontFamily": "Hack",  
    > "terminal.integrated.shell.windows": C:\\Windows\\sysnative\\WindowsPowerShell\\v1.0\\powershell.exe",