title: "Blogging with GitHub Pages"
date: 2015-04-15 22:36:39
tags: tutorial
---
## Introduction
 Blogging with GitHub pages, is often a hard question to answer owing to GitHub pages only supporting Jekyll and static HTML.
 However after reading this tutorial you will be able to make your own blog, using GitHub pages with ease.

## Prerequisites
 [hexo-cli](http://hexo.io/)
 [Git](http://www.git-scm.com/), and set up a GitHub repository that will contain your website

## Tutorial
 1. To start with, you will need to make sure you have all the prerequisites installed.
 
 2. Next you will want to create an empty directory and do the following commands in Terminal.
   ```
   hexo init
   npm install
   ```
   This will initialize the directory as a Hexo blog.
   The second command, will get all the dependencies of your blog, so you that every time you update your package.json!
   
 3. Generate the static version of your blog.
   ```
   hexo generate
   ```
   This generates all the static files for your site, we will commit these next.
   
 4. Commit and push to your repository
   ```
   cd public
   git init
   git remote add origin git@github.com:(username)/(username).github.io.git
   git add --all .
   git commit "Initial commit"
   git push
   ```
   The above moves into the directory containing the generated (static) files.
   The rest initializes a local Git repository and pushes to your GitHub pages repository.
   
 5. Commit and push your non-static content to a new branch.
   ```
   cd ../
   git init
   git remote add origin git@github.com:(username)/(username).github.io.git
   git fetch
   git checkout source
   git add --all .
   git commit "Initial commit"
   git push
   ```
   The above moves into the directory containing the non-static files.
   The rest initializes a local Git repository and pushes to the 'source' branch on your GitHub pages repository.
   
 6. Set your default branch to 'source' on GitHub
   On your web browser navigate to your repository page.
   Navigate now to the settings, for your repository.
   Set the default branch to 'source'.
   I have done this for the convenience of any of your contributors.
   
 7. Setup auto static generation with a CI
   Like, me you can make it so a CI automatically pushes your static content to your 'master' branch.
   This can be done with any CI, I use [Travis-CI](https://travis-ci.org/).
   You will need to get the CI to automatically generate the static files, and push them to git.
   ```
   hexo generate
   ```
   The above generates the static files (they are placed inside the 'public' directory)
   
 8. Start working on your site!
   By this point you can start creating content and modifying the settings of your site.
   eg:
     * Change the theme
     * Add some plugins
     * Setting up your site details in '_config.yml'
     
## Tips
  * Use `hexo server` to test
  * Add your site to [Google Webmasters](https://www.google.com/webmasters/), and for other search engines too
    You may want to generate a sitemap for this, you can do so with the [hexo-generator-sitemap](https://githubcom/hexojs/hexo-generator-sitemap) plugin.
