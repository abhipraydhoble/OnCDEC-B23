## create new directory
## to intitialize git here type below command
````
git init
````
## configure identity using global credentials
````
git config --global user.name "abhi"
````
````
git config --global user.email "abhipraydhoble@outlook.com"
````
````
git config --global --list
````
## create files
````
touch harry.txt  ron.txt
````
## Add files to staging area
````
git add .
````
## Commit staging files
````
git commit -m "team hogwarts"
````
## Check commit history
````
git log
````

## Now add remote repository
````
git remote add origin https://github.com/abhipraydhoble/hogwarts_school.git
````
## check remote added or not
````
git remote -v
````

## Push changes to remote repository
````
git push origin master
````
