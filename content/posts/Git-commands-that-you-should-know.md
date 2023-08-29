---
title: Top Github Commands that you should know
date: 2023-07-14T15:10:44+05:30
draft: false
---

# GitHub Commands Tutorial

## Table of Contents
1. [Configuring GitHub](#configuring-github)
2. [Creating a New Repository](#creating-a-new-repository)
3. [Cloning a Repository](#cloning-a-repository)
4. [Adding Files to a Repository](#adding-files-to-a-repository)
5. [Committing Changes](#committing-changes)
6. [Pushing Changes to GitHub](#pushing-changes-to-github)
7. [Pulling the Latest Version from GitHub](#pulling-the-latest-version-from-github)
8. [Creating a New Branch](#creating-a-new-branch)
9. [Switching Between Branches](#switching-between-branches)
10. [Merging Branches](#merging-branches)


## Configuring GitHub
Before using Git commands, make sure to configure your GitHub account. You need to set your email address and username with the following commands:

```bash
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"
```

## Creating a New Repository
To create a new repository on your local machine:
```bash
mkdir new-repo
cd new-repo
git init
```

## Cloning a Repository
If you want to clone an existing repository from GitHub:
```bash
git clone https://github.com/username/repo.git

```

## Adding Files to a Repository
To add a file to the repository:
```bash
git add file.txt
```
To add all files:

```bash
git add .
```
## Committing Changes
After adding your files, you should commit your changes:
```bash
git commit -m "Commit message"
```

## Pushing Changes to GitHub
After committing your changes, you can push them to the GitHub repository:
```bash
git push origin master
```

## Pulling the Latest Version from GitHub
To keep your local copy of the code updated with its GitHub version:

```bash
git pull origin master
```


## Creating a New Branch
To create a new branch in your repository:
```bash
git checkout -b new-branch
```

## Switching Between Branches
To switch from one branch to another:

```bash
git checkout branch-name
```

Note: Before merging, you should be in the recipient branch.

# My Personal Shortcut

Just write(when you are so sure about your code):

```bash
git status
git add .
git commit -m "Comment"
git push
```
or you can save all this four commands in a deploy.sh file and just run ./deploy.sh 
If you are trying this for the first time, don't forget to give the necessary permission to deploy.sh file, to give permission just type:

```bash
chmod +777 deploy.sh
```

This basic guide should help you get started with the most important GitHub commands.


