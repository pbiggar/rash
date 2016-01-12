



<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>letsencrypt.sh/letsencrypt.sh at master · lukas2511/letsencrypt.sh · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="lukas2511/letsencrypt.sh" name="twitter:title" /><meta content="letsencrypt.sh - letsencrypt/acme client implemented as a shell-script" name="twitter:description" /><meta content="https://avatars1.githubusercontent.com/u/85965?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars1.githubusercontent.com/u/85965?v=3&amp;s=400" property="og:image" /><meta content="lukas2511/letsencrypt.sh" property="og:title" /><meta content="https://github.com/lukas2511/letsencrypt.sh" property="og:url" /><meta content="letsencrypt.sh - letsencrypt/acme client implemented as a shell-script" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="BA0F2AEA:62B5:3077830:569570EC" name="octolytics-dimension-request_id" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />
<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged Out">



        <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

        <meta name="expected-hostname" content="github.com">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta content="0c74a6f74e76d169d31c7aeedde7ac9ec12c41d1" name="form-nonce" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-2cd8e7b7c650541e94a142c9c10fb231b81455e1777c62510eb9b3402cc220b3.css" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2-59f5919583cf2e70e57d04603053adbf07b93660733ba65df25454e92d209fe1.css" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="056c86881be23af5cd8a809fecb37d38">

      
  <meta name="description" content="letsencrypt.sh - letsencrypt/acme client implemented as a shell-script">
  <meta name="go-import" content="github.com/lukas2511/letsencrypt.sh git https://github.com/lukas2511/letsencrypt.sh.git">

  <meta content="85965" name="octolytics-dimension-user_id" /><meta content="lukas2511" name="octolytics-dimension-user_login" /><meta content="47437268" name="octolytics-dimension-repository_id" /><meta content="lukas2511/letsencrypt.sh" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="47437268" name="octolytics-dimension-repository_network_root_id" /><meta content="lukas2511/letsencrypt.sh" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/lukas2511/letsencrypt.sh/commits/master.atom" rel="alternate" title="Recent Commits to letsencrypt.sh:master" type="application/atom+xml">

  </head>


  <body class="logged_out   env-production  vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



      
      <div class="header header-logged-out" role="banner">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <span aria-hidden="true" class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions" role="navigation">
        <a class="btn btn-primary" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
      <a class="btn" href="/login?return_to=%2Flukas2511%2Fletsencrypt.sh%2Fblob%2Fmaster%2Fletsencrypt.sh" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/lukas2511/letsencrypt.sh/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/lukas2511/letsencrypt.sh/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      aria-label="Search this repository"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
    </div>

      <ul class="header-nav left" role="navigation">
          <li class="header-nav-item">
            <a class="header-nav-link" href="/explore" data-ga-click="(Logged out) Header, go to explore, text:explore">Explore</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/features" data-ga-click="(Logged out) Header, go to features, text:features">Features</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://enterprise.github.com/" data-ga-click="(Logged out) Header, go to enterprise, text:enterprise">Enterprise</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/pricing" data-ga-click="(Logged out) Header, go to pricing, text:pricing">Pricing</a>
          </li>
      </ul>

  </div>
</div>



    <div id="start-of-content" class="accessibility-aid"></div>

      <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/WebPage">
    <div id="js-repo-pjax-container" class="context-loader-container js-repo-nav-next" data-pjax-container>
      
<div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
  <div class="container repohead-details-container">

    

<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2Flukas2511%2Fletsencrypt.sh"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span aria-hidden="true" class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/lukas2511/letsencrypt.sh/watchers">
    44
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Flukas2511%2Fletsencrypt.sh"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span aria-hidden="true" class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/lukas2511/letsencrypt.sh/stargazers">
      585
    </a>

  </li>

  <li>
      <a href="/login?return_to=%2Flukas2511%2Fletsencrypt.sh"
        class="btn btn-sm btn-with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span aria-hidden="true" class="octicon octicon-repo-forked"></span>
        Fork
      </a>

    <a href="/lukas2511/letsencrypt.sh/network" class="social-count">
      52
    </a>
  </li>
</ul>

    <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public ">
  <span aria-hidden="true" class="octicon octicon-repo"></span>
  <span class="author"><a href="/lukas2511" class="url fn" itemprop="url" rel="author"><span itemprop="title">lukas2511</span></a></span><!--
--><span class="path-divider">/</span><!--
--><strong><a href="/lukas2511/letsencrypt.sh" data-pjax="#js-repo-pjax-container">letsencrypt.sh</a></strong>

  <span class="page-context-loader">
    <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
  </span>

</h1>

  </div>
  <div class="container">
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <a href="/lukas2511/letsencrypt.sh" aria-label="Code" aria-selected="true" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /lukas2511/letsencrypt.sh">
    <span aria-hidden="true" class="octicon octicon-code"></span>
    Code
</a>
    <a href="/lukas2511/letsencrypt.sh/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /lukas2511/letsencrypt.sh/issues">
      <span aria-hidden="true" class="octicon octicon-issue-opened"></span>
      Issues
      <span class="counter">4</span>
</a>
  <a href="/lukas2511/letsencrypt.sh/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /lukas2511/letsencrypt.sh/pulls">
    <span aria-hidden="true" class="octicon octicon-git-pull-request"></span>
    Pull requests
    <span class="counter">2</span>
</a>
    <a href="/lukas2511/letsencrypt.sh/wiki" class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /lukas2511/letsencrypt.sh/wiki">
      <span aria-hidden="true" class="octicon octicon-book"></span>
      Wiki
</a>
  <a href="/lukas2511/letsencrypt.sh/pulse" class="js-selected-navigation-item reponav-item" data-selected-links="pulse /lukas2511/letsencrypt.sh/pulse">
    <span aria-hidden="true" class="octicon octicon-pulse"></span>
    Pulse
</a>
  <a href="/lukas2511/letsencrypt.sh/graphs" class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors /lukas2511/letsencrypt.sh/graphs">
    <span aria-hidden="true" class="octicon octicon-graph"></span>
    Graphs
</a>

</nav>

  </div>
</div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    

<a href="/lukas2511/letsencrypt.sh/blob/2a7b48822a42ce0c2baf0509b28e1026928380e0/letsencrypt.sh" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:72c39f4e9d79209a49ad6a946d1d70c0 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="master"
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span aria-label="Close" class="octicon octicon-x js-menu-close" role="button"></span>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/lukas2511/letsencrypt.sh/blob/master/letsencrypt.sh"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span aria-hidden="true" class="octicon octicon-check select-menu-item-icon"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/lukas2511/letsencrypt.sh/find/master"
          class="js-show-file-finder btn btn-sm"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/lukas2511/letsencrypt.sh" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">letsencrypt.sh</span></a></span></span><span class="separator">/</span><strong class="final-path">letsencrypt.sh</strong>
  </div>
</div>


  <div class="commit-tease">
      <span class="right">
        <a class="commit-tease-sha" href="/lukas2511/letsencrypt.sh/commit/2a7b48822a42ce0c2baf0509b28e1026928380e0" data-pjax>
          2a7b488
        </a>
        <time datetime="2016-01-10T03:46:52Z" is="relative-time">Jan 10, 2016</time>
      </span>
      <div>
        <img alt="@lukas2511" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/85965?v=3&amp;s=40" width="20" />
        <a href="/lukas2511" class="user-mention" rel="author">lukas2511</a>
          <a href="/lukas2511/letsencrypt.sh/commit/2a7b48822a42ce0c2baf0509b28e1026928380e0" class="message" data-pjax="true" title="use -z instead of `== &quot;&quot;`.. it&#39;s late.">use -z instead of `== ""`.. it's late.</a>
      </div>

    <div class="commit-tease-contributors">
      <a class="muted-link contributors-toggle" href="#blob_contributors_box" rel="facebox">
        <strong>9</strong>
         contributors
      </a>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="lukas2511" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=lukas2511"><img alt="@lukas2511" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/85965?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="rudis" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=rudis"><img alt="@rudis" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/390994?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="germeier" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=germeier"><img alt="@germeier" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/2720210?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="digint" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=digint"><img alt="@digint" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/7590973?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="tralafiti" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=tralafiti"><img alt="@tralafiti" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/197687?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="bdossantos" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=bdossantos"><img alt="@bdossantos" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/245284?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="erdgeist" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=erdgeist"><img alt="@erdgeist" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/59463?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="onovy" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=onovy"><img alt="@onovy" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/1649603?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="LynxChaus" href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh?author=LynxChaus"><img alt="@LynxChaus" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/4587687?v=3&amp;s=40" width="20" /> </a>


    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@lukas2511" height="24" src="https://avatars3.githubusercontent.com/u/85965?v=3&amp;s=48" width="24" />
            <a href="/lukas2511">lukas2511</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@rudis" height="24" src="https://avatars1.githubusercontent.com/u/390994?v=3&amp;s=48" width="24" />
            <a href="/rudis">rudis</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@germeier" height="24" src="https://avatars2.githubusercontent.com/u/2720210?v=3&amp;s=48" width="24" />
            <a href="/germeier">germeier</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@digint" height="24" src="https://avatars2.githubusercontent.com/u/7590973?v=3&amp;s=48" width="24" />
            <a href="/digint">digint</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@tralafiti" height="24" src="https://avatars2.githubusercontent.com/u/197687?v=3&amp;s=48" width="24" />
            <a href="/tralafiti">tralafiti</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@bdossantos" height="24" src="https://avatars3.githubusercontent.com/u/245284?v=3&amp;s=48" width="24" />
            <a href="/bdossantos">bdossantos</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@erdgeist" height="24" src="https://avatars2.githubusercontent.com/u/59463?v=3&amp;s=48" width="24" />
            <a href="/erdgeist">erdgeist</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@onovy" height="24" src="https://avatars2.githubusercontent.com/u/1649603?v=3&amp;s=48" width="24" />
            <a href="/onovy">onovy</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@LynxChaus" height="24" src="https://avatars3.githubusercontent.com/u/4587687?v=3&amp;s=48" width="24" />
            <a href="/LynxChaus">LynxChaus</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/lukas2511/letsencrypt.sh/raw/master/letsencrypt.sh" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/lukas2511/letsencrypt.sh/blame/master/letsencrypt.sh" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/lukas2511/letsencrypt.sh/commits/master/letsencrypt.sh" class="btn btn-sm " rel="nofollow">History</a>
    </div>


        <button type="button" class="btn-octicon disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span aria-hidden="true" class="octicon octicon-pencil"></span>
        </button>
        <button type="button" class="btn-octicon btn-octicon-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span aria-hidden="true" class="octicon octicon-trashcan"></span>
        </button>
  </div>

  <div class="file-info">
      <span class="file-mode" title="File mode">executable file</span>
      <span class="file-info-divider"></span>
      617 lines (517 sloc)
      <span class="file-info-divider"></span>
    22.6 KB
  </div>
</div>

  

  <div class="blob-wrapper data type-shell">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#!/usr/bin/env bash</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">set</span> -e</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">set</span> -u</td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">set</span> -o pipefail</td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">umask</span> 077 <span class="pl-c"># paranoid umask, we&#39;re creating private keys</span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Get the directory in which this script is stored</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line">SCRIPTDIR=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span> <span class="pl-c1">cd</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span> dirname <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASH_SOURCE[0]}</span><span class="pl-pds">&quot;</span></span> <span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&amp;&amp;</span> <span class="pl-c1">pwd</span> <span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">BASEDIR=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${SCRIPTDIR}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Check for script dependencies</span></td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line"><span class="pl-en">check_dependencies</span>() {</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">  curl -V <span class="pl-k">&gt;</span> /dev/null <span class="pl-k">2&gt;&amp;1</span> <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>This script requires curl.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line">  openssl version <span class="pl-k">&gt;</span> /dev/null <span class="pl-k">2&gt;&amp;1</span> <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>This script requres an openssl binary.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line">  sed <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&lt;</span> /dev/null <span class="pl-k">&gt;</span> /dev/null <span class="pl-k">2&gt;&amp;1</span> <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>This script requres sed.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line">  grep -V <span class="pl-k">&gt;</span> /dev/null <span class="pl-k">2&gt;&amp;1</span> <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>This script requres grep.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line">  mktemp -u -t XXXXXX <span class="pl-k">&gt;</span> /dev/null <span class="pl-k">2&gt;&amp;1</span> <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>This script requires mktemp.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Setup default config values, search for and load configuration files</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line"><span class="pl-en">load_config</span>() {</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Check for config in various locations</span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONFIG<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span> <span class="pl-smi">check_config</span> <span class="pl-k">in</span> <span class="pl-s"><span class="pl-pds">&quot;</span>/etc/letsencrypt.sh<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span>/usr/local/etc/letsencrypt.sh<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PWD}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${SCRIPTDIR}</span><span class="pl-pds">&quot;</span></span><span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">if</span> [[ <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${check_config}</span>/config.sh<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">        BASEDIR=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${check_config}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">        CONFIG=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${check_config}</span>/config.sh<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">break</span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Default values</span></td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">  CA=<span class="pl-s"><span class="pl-pds">&quot;</span>https://acme-v01.api.letsencrypt.org/directory<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">  LICENSE=<span class="pl-s"><span class="pl-pds">&quot;</span>https://letsencrypt.org/documents/LE-SA-v1.0.1-July-27-2015.pdf<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">  CHALLENGETYPE=<span class="pl-s"><span class="pl-pds">&quot;</span>http-01<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">  HOOK=</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line">  RENEW_DAYS=<span class="pl-s"><span class="pl-pds">&quot;</span>30<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">  PRIVATE_KEY=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/private_key.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">  KEYSIZE=<span class="pl-s"><span class="pl-pds">&quot;</span>4096<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">  WELLKNOWN=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/.acme-challenges<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">  PRIVATE_KEY_RENEW=<span class="pl-s"><span class="pl-pds">&quot;</span>no<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">  OPENSSL_CNF=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl version -d <span class="pl-k">|</span> cut -d<span class="pl-s"><span class="pl-pds">&#39;</span>&quot;<span class="pl-pds">&#39;</span></span> -f2<span class="pl-pds">)</span></span>/openssl.cnf<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line">  CONTACT_EMAIL=</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line">  LOCKFILE=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/lock<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONFIG<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>#<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span># !! WARNING !! No config file found, using default config!<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>#<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">elif</span> [[ <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONFIG}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span># INFO: Using config file <span class="pl-smi">${CONFIG}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line">    BASEDIR=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>dirname <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONFIG}</span><span class="pl-pds">&quot;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># shellcheck disable=SC1090</span></td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">.</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONFIG}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line">    _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Specified config file doesn&#39;t exist.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Remove slash from end of BASEDIR. Mostly for cleaner outputs, doesn&#39;t change functionality.</span></td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">  BASEDIR=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR<span class="pl-k">%%/</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Check BASEDIR and set default variables</span></td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-d</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>BASEDIR does not exist: <span class="pl-smi">${BASEDIR}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_HOOK<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> HOOK=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_HOOK}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_CHALLENGETYPE<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> CHALLENGETYPE=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_CHALLENGETYPE}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CHALLENGETYPE}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> (http-01<span class="pl-k">|</span>dns-01) ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Unknown challenge type <span class="pl-smi">${CHALLENGETYPE}</span>... can not continue.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CHALLENGETYPE}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>dns-01<span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${HOOK}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line">   _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Challenge type dns-01 needs a hook script for deployment... can not continue.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Initialize system</span></td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line"><span class="pl-en">init_system</span>() {</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line">  load_config</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Lockfile handling (prevents concurrent access)</span></td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line">  ( <span class="pl-c1">set</span> -C<span class="pl-k">;</span> date <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${LOCKFILE}</span><span class="pl-pds">&quot;</span></span> ) <span class="pl-k">2&gt;</span>/dev/null <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Lock file &#39;<span class="pl-smi">${LOCKFILE}</span>&#39; present, aborting.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">  <span class="pl-en">remove_lock</span>() { rm -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${LOCKFILE}</span><span class="pl-pds">&quot;</span></span><span class="pl-k">;</span> }</td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">trap</span> <span class="pl-s"><span class="pl-pds">&#39;</span>remove_lock<span class="pl-pds">&#39;</span></span> EXIT</td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Get CA URLs</span></td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">  CA_DIRECTORY=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>http_request get <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA}</span><span class="pl-pds">&quot;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">  CA_NEW_CERT=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>%s<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_DIRECTORY}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value new-cert<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&amp;&amp;</span></td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">  CA_NEW_AUTHZ=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>%s<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_DIRECTORY}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value new-authz<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&amp;&amp;</span></td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">  CA_NEW_REG=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>%s<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_DIRECTORY}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value new-reg<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&amp;&amp;</span></td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># shellcheck disable=SC2015</span></td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">  CA_REVOKE_CERT=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>%s<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_DIRECTORY}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value revoke-cert<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> <span class="pl-k">||</span></td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">  _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Problem retrieving ACME/CA-URLs, check if your configured CA points to the directory entrypoint.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Export some environment variables to be used in hook script</span></td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">export</span> WELLKNOWN BASEDIR CONFIG</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Checking for private key ...</span></td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">  register_new_key=<span class="pl-s"><span class="pl-pds">&quot;</span>no<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_PRIVATE_KEY<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># a private key was specified from the command line so use it for this run</span></td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Using private key <span class="pl-smi">${PARAM_PRIVATE_KEY}</span> instead of account key<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line">    PRIVATE_KEY=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Check if private account key exists, if it doesn&#39;t exist yet generate a new one (rsa key)</span></td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">!</span> <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>+ Generating account key...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">      _openssl genrsa -out <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${KEYSIZE}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">      register_new_key=<span class="pl-s"><span class="pl-pds">&quot;</span>yes<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line">  openssl rsa -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span> -check <span class="pl-k">2&gt;</span>/dev/null <span class="pl-k">&gt;</span> /dev/null <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Private key is not valid, can not continue.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Get public components from private key and calculate thumbprint</span></td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">  pubExponent64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl rsa -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span> -noout -text <span class="pl-k">|</span> grep publicExponent <span class="pl-k">|</span> grep -oE <span class="pl-s"><span class="pl-pds">&quot;</span>0x[a-f0-9]+<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> cut -d<span class="pl-s"><span class="pl-pds">&#39;</span>x<span class="pl-pds">&#39;</span></span> -f2 <span class="pl-k">|</span> hex2bin <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line">  pubMod64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl rsa -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span> -noout -modulus <span class="pl-k">|</span> cut -d<span class="pl-s"><span class="pl-pds">&#39;</span>=<span class="pl-pds">&#39;</span></span> -f2 <span class="pl-k">|</span> hex2bin <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">  thumbprint=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;e&quot;:&quot;%s&quot;,&quot;kty&quot;:&quot;RSA&quot;,&quot;n&quot;:&quot;%s&quot;}<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${pubExponent64}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${pubMod64}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> openssl sha -sha256 -binary <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># If we generated a new private key in the step above we have to register it with the acme-server</span></td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${register_new_key}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>yes<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>+ Registering account key with letsencrypt...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">    [[ <span class="pl-k">!</span> <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_REG}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Certificate authority doesn&#39;t allow registrations.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># If an email for the contact has been provided then adding it to the registration request</span></td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONTACT_EMAIL}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line">      signed_request <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_REG}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;resource&quot;: &quot;new-reg&quot;, &quot;contact&quot;:[&quot;mailto:<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CONTACT_EMAIL}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;], &quot;agreement&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$LICENSE</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span> <span class="pl-k">&gt;</span> /dev/null</td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line">      signed_request <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_REG}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;resource&quot;: &quot;new-reg&quot;, &quot;agreement&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$LICENSE</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span> <span class="pl-k">&gt;</span> /dev/null</td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-d</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${WELLKNOWN}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>WELLKNOWN directory doesn&#39;t exist, please create <span class="pl-smi">${WELLKNOWN}</span> and set appropriate permissions.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Print error message and exit with error</span></td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code blob-code-inner js-file-line"><span class="pl-en">_exiterr</span>() {</td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>ERROR: <span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">exit</span> 1</td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Encode data as url-safe formatted base64</span></td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code blob-code-inner js-file-line"><span class="pl-en">urlbase64</span>() {</td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># urlbase64: base64 encoded string with &#39;+&#39; replaced with &#39;-&#39; and &#39;/&#39; replaced with &#39;_&#39;</span></td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code blob-code-inner js-file-line">  openssl base64 -e <span class="pl-k">|</span> tr -d <span class="pl-s"><span class="pl-pds">&#39;</span>\n\r<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sed -e <span class="pl-s"><span class="pl-pds">&#39;</span>s:=*$::g<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>y:+/:-_:<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L143" class="blob-num js-line-number" data-line-number="143"></td>
        <td id="LC143" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L144" class="blob-num js-line-number" data-line-number="144"></td>
        <td id="LC144" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L145" class="blob-num js-line-number" data-line-number="145"></td>
        <td id="LC145" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Convert hex string to binary data</span></td>
      </tr>
      <tr>
        <td id="L146" class="blob-num js-line-number" data-line-number="146"></td>
        <td id="LC146" class="blob-code blob-code-inner js-file-line"><span class="pl-en">hex2bin</span>() {</td>
      </tr>
      <tr>
        <td id="L147" class="blob-num js-line-number" data-line-number="147"></td>
        <td id="LC147" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Remove spaces, add leading zero, escape as hex string and parse with printf</span></td>
      </tr>
      <tr>
        <td id="L148" class="blob-num js-line-number" data-line-number="148"></td>
        <td id="LC148" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">printf</span> -- <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>cat <span class="pl-k">|</span> sed -E -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/[[:space:]]//g<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/^(.(.{2})*)$/0\1/<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/(.{2})/\\x\1/g<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L149" class="blob-num js-line-number" data-line-number="149"></td>
        <td id="LC149" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L150" class="blob-num js-line-number" data-line-number="150"></td>
        <td id="LC150" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L151" class="blob-num js-line-number" data-line-number="151"></td>
        <td id="LC151" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Get string value from json dictionary</span></td>
      </tr>
      <tr>
        <td id="L152" class="blob-num js-line-number" data-line-number="152"></td>
        <td id="LC152" class="blob-code blob-code-inner js-file-line"><span class="pl-en">get_json_string_value</span>() {</td>
      </tr>
      <tr>
        <td id="L153" class="blob-num js-line-number" data-line-number="153"></td>
        <td id="LC153" class="blob-code blob-code-inner js-file-line">  grep -Eo <span class="pl-s"><span class="pl-pds">&#39;</span>&quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;:[[:space:]]*&quot;[^&quot;]*&quot;<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> cut -d<span class="pl-s"><span class="pl-pds">&#39;</span>&quot;<span class="pl-pds">&#39;</span></span> -f4</td>
      </tr>
      <tr>
        <td id="L154" class="blob-num js-line-number" data-line-number="154"></td>
        <td id="LC154" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L155" class="blob-num js-line-number" data-line-number="155"></td>
        <td id="LC155" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L156" class="blob-num js-line-number" data-line-number="156"></td>
        <td id="LC156" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># OpenSSL writes to stderr/stdout even when there are no errors. So just</span></td>
      </tr>
      <tr>
        <td id="L157" class="blob-num js-line-number" data-line-number="157"></td>
        <td id="LC157" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># display the output if the exit code was != 0 to simplify debugging.</span></td>
      </tr>
      <tr>
        <td id="L158" class="blob-num js-line-number" data-line-number="158"></td>
        <td id="LC158" class="blob-code blob-code-inner js-file-line"><span class="pl-en">_openssl</span>() {</td>
      </tr>
      <tr>
        <td id="L159" class="blob-num js-line-number" data-line-number="159"></td>
        <td id="LC159" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">set</span> +e</td>
      </tr>
      <tr>
        <td id="L160" class="blob-num js-line-number" data-line-number="160"></td>
        <td id="LC160" class="blob-code blob-code-inner js-file-line">  out=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${<span class="pl-k">@</span>}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">2&gt;&amp;1</span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L161" class="blob-num js-line-number" data-line-number="161"></td>
        <td id="LC161" class="blob-code blob-code-inner js-file-line">  res=<span class="pl-smi">$?</span></td>
      </tr>
      <tr>
        <td id="L162" class="blob-num js-line-number" data-line-number="162"></td>
        <td id="LC162" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">set</span> -e</td>
      </tr>
      <tr>
        <td id="L163" class="blob-num js-line-number" data-line-number="163"></td>
        <td id="LC163" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-smi">$res</span> <span class="pl-k">-ne</span> 0 ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L164" class="blob-num js-line-number" data-line-number="164"></td>
        <td id="LC164" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>  + ERROR: failed to run <span class="pl-smi">$*</span> (Exitcode: <span class="pl-smi">$res</span>)<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L165" class="blob-num js-line-number" data-line-number="165"></td>
        <td id="LC165" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L166" class="blob-num js-line-number" data-line-number="166"></td>
        <td id="LC166" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Details:<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L167" class="blob-num js-line-number" data-line-number="167"></td>
        <td id="LC167" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">$out</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L168" class="blob-num js-line-number" data-line-number="168"></td>
        <td id="LC168" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">exit</span> <span class="pl-smi">$res</span></td>
      </tr>
      <tr>
        <td id="L169" class="blob-num js-line-number" data-line-number="169"></td>
        <td id="LC169" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L170" class="blob-num js-line-number" data-line-number="170"></td>
        <td id="LC170" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L171" class="blob-num js-line-number" data-line-number="171"></td>
        <td id="LC171" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L172" class="blob-num js-line-number" data-line-number="172"></td>
        <td id="LC172" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Send http(s) request with specified method</span></td>
      </tr>
      <tr>
        <td id="L173" class="blob-num js-line-number" data-line-number="173"></td>
        <td id="LC173" class="blob-code blob-code-inner js-file-line"><span class="pl-en">http_request</span>() {</td>
      </tr>
      <tr>
        <td id="L174" class="blob-num js-line-number" data-line-number="174"></td>
        <td id="LC174" class="blob-code blob-code-inner js-file-line">  tempcont=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>mktemp -t XXXXXX<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L175" class="blob-num js-line-number" data-line-number="175"></td>
        <td id="LC175" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L176" class="blob-num js-line-number" data-line-number="176"></td>
        <td id="LC176" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>head<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L177" class="blob-num js-line-number" data-line-number="177"></td>
        <td id="LC177" class="blob-code blob-code-inner js-file-line">    statuscode=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>curl -s -w <span class="pl-s"><span class="pl-pds">&quot;</span>%{http_code}<span class="pl-pds">&quot;</span></span> -o <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${2}</span><span class="pl-pds">&quot;</span></span> -I<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L178" class="blob-num js-line-number" data-line-number="178"></td>
        <td id="LC178" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">elif</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>get<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L179" class="blob-num js-line-number" data-line-number="179"></td>
        <td id="LC179" class="blob-code blob-code-inner js-file-line">    statuscode=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>curl -s -w <span class="pl-s"><span class="pl-pds">&quot;</span>%{http_code}<span class="pl-pds">&quot;</span></span> -o <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${2}</span><span class="pl-pds">&quot;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L180" class="blob-num js-line-number" data-line-number="180"></td>
        <td id="LC180" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">elif</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>post<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L181" class="blob-num js-line-number" data-line-number="181"></td>
        <td id="LC181" class="blob-code blob-code-inner js-file-line">    statuscode=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>curl -s -w <span class="pl-s"><span class="pl-pds">&quot;</span>%{http_code}<span class="pl-pds">&quot;</span></span> -o <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${2}</span><span class="pl-pds">&quot;</span></span> -d <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${3}</span><span class="pl-pds">&quot;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L182" class="blob-num js-line-number" data-line-number="182"></td>
        <td id="LC182" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L183" class="blob-num js-line-number" data-line-number="183"></td>
        <td id="LC183" class="blob-code blob-code-inner js-file-line">    _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Unknown request method: <span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L184" class="blob-num js-line-number" data-line-number="184"></td>
        <td id="LC184" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L185" class="blob-num js-line-number" data-line-number="185"></td>
        <td id="LC185" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L186" class="blob-num js-line-number" data-line-number="186"></td>
        <td id="LC186" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">!</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${statuscode<span class="pl-k">:</span>0<span class="pl-k">:</span>1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>2<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L187" class="blob-num js-line-number" data-line-number="187"></td>
        <td id="LC187" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>  + ERROR: An error occurred while sending <span class="pl-smi">${1}</span>-request to <span class="pl-smi">${2}</span> (Status <span class="pl-smi">${statuscode}</span>)<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L188" class="blob-num js-line-number" data-line-number="188"></td>
        <td id="LC188" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L189" class="blob-num js-line-number" data-line-number="189"></td>
        <td id="LC189" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Details:<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L190" class="blob-num js-line-number" data-line-number="190"></td>
        <td id="LC190" class="blob-code blob-code-inner js-file-line">    cat <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L191" class="blob-num js-line-number" data-line-number="191"></td>
        <td id="LC191" class="blob-code blob-code-inner js-file-line">    rm -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L192" class="blob-num js-line-number" data-line-number="192"></td>
        <td id="LC192" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L193" class="blob-num js-line-number" data-line-number="193"></td>
        <td id="LC193" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Wait for hook script to clean the challenge if used</span></td>
      </tr>
      <tr>
        <td id="L194" class="blob-num js-line-number" data-line-number="194"></td>
        <td id="LC194" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${HOOK}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token<span class="pl-k">:</span>+set}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L195" class="blob-num js-line-number" data-line-number="195"></td>
        <td id="LC195" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">${HOOK}</span> <span class="pl-s"><span class="pl-pds">&quot;</span>clean_challenge<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span><span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L196" class="blob-num js-line-number" data-line-number="196"></td>
        <td id="LC196" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L197" class="blob-num js-line-number" data-line-number="197"></td>
        <td id="LC197" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L198" class="blob-num js-line-number" data-line-number="198"></td>
        <td id="LC198" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># remove temporary domains.txt file if used</span></td>
      </tr>
      <tr>
        <td id="L199" class="blob-num js-line-number" data-line-number="199"></td>
        <td id="LC199" class="blob-code blob-code-inner js-file-line">    [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_DOMAIN<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> rm <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${DOMAINS_TXT}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L200" class="blob-num js-line-number" data-line-number="200"></td>
        <td id="LC200" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">exit</span> 1</td>
      </tr>
      <tr>
        <td id="L201" class="blob-num js-line-number" data-line-number="201"></td>
        <td id="LC201" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L202" class="blob-num js-line-number" data-line-number="202"></td>
        <td id="LC202" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L203" class="blob-num js-line-number" data-line-number="203"></td>
        <td id="LC203" class="blob-code blob-code-inner js-file-line">  cat <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L204" class="blob-num js-line-number" data-line-number="204"></td>
        <td id="LC204" class="blob-code blob-code-inner js-file-line">  rm -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tempcont}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L205" class="blob-num js-line-number" data-line-number="205"></td>
        <td id="LC205" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L206" class="blob-num js-line-number" data-line-number="206"></td>
        <td id="LC206" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L207" class="blob-num js-line-number" data-line-number="207"></td>
        <td id="LC207" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Send signed request</span></td>
      </tr>
      <tr>
        <td id="L208" class="blob-num js-line-number" data-line-number="208"></td>
        <td id="LC208" class="blob-code blob-code-inner js-file-line"><span class="pl-en">signed_request</span>() {</td>
      </tr>
      <tr>
        <td id="L209" class="blob-num js-line-number" data-line-number="209"></td>
        <td id="LC209" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Encode payload as urlbase64</span></td>
      </tr>
      <tr>
        <td id="L210" class="blob-num js-line-number" data-line-number="210"></td>
        <td id="LC210" class="blob-code blob-code-inner js-file-line">  payload64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${2}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L211" class="blob-num js-line-number" data-line-number="211"></td>
        <td id="LC211" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L212" class="blob-num js-line-number" data-line-number="212"></td>
        <td id="LC212" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Retrieve nonce from acme-server</span></td>
      </tr>
      <tr>
        <td id="L213" class="blob-num js-line-number" data-line-number="213"></td>
        <td id="LC213" class="blob-code blob-code-inner js-file-line">  nonce=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>http_request head <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> grep Replay-Nonce: <span class="pl-k">|</span> awk -F <span class="pl-s"><span class="pl-pds">&#39;</span>: <span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{print $2}<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> tr -d <span class="pl-s"><span class="pl-pds">&#39;</span>\n\r<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L214" class="blob-num js-line-number" data-line-number="214"></td>
        <td id="LC214" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L215" class="blob-num js-line-number" data-line-number="215"></td>
        <td id="LC215" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Build header with just our public key and algorithm information</span></td>
      </tr>
      <tr>
        <td id="L216" class="blob-num js-line-number" data-line-number="216"></td>
        <td id="LC216" class="blob-code blob-code-inner js-file-line">  header=<span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;alg&quot;: &quot;RS256&quot;, &quot;jwk&quot;: {&quot;e&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${pubExponent64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;, &quot;kty&quot;: &quot;RSA&quot;, &quot;n&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${pubMod64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}}<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L217" class="blob-num js-line-number" data-line-number="217"></td>
        <td id="LC217" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L218" class="blob-num js-line-number" data-line-number="218"></td>
        <td id="LC218" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Build another header which also contains the previously received nonce and encode it as urlbase64</span></td>
      </tr>
      <tr>
        <td id="L219" class="blob-num js-line-number" data-line-number="219"></td>
        <td id="LC219" class="blob-code blob-code-inner js-file-line">  protected=<span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;alg&quot;: &quot;RS256&quot;, &quot;jwk&quot;: {&quot;e&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${pubExponent64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;, &quot;kty&quot;: &quot;RSA&quot;, &quot;n&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${pubMod64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}, &quot;nonce&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${nonce}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L220" class="blob-num js-line-number" data-line-number="220"></td>
        <td id="LC220" class="blob-code blob-code-inner js-file-line">  protected64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${protected}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L221" class="blob-num js-line-number" data-line-number="221"></td>
        <td id="LC221" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L222" class="blob-num js-line-number" data-line-number="222"></td>
        <td id="LC222" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Sign header with nonce and our payload with our private key and encode signature as urlbase64</span></td>
      </tr>
      <tr>
        <td id="L223" class="blob-num js-line-number" data-line-number="223"></td>
        <td id="LC223" class="blob-code blob-code-inner js-file-line">  signed64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${protected64}</span>.<span class="pl-smi">${payload64}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> openssl dgst -sha256 -sign <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L224" class="blob-num js-line-number" data-line-number="224"></td>
        <td id="LC224" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L225" class="blob-num js-line-number" data-line-number="225"></td>
        <td id="LC225" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Send header + extended header + payload + signature to the acme-server</span></td>
      </tr>
      <tr>
        <td id="L226" class="blob-num js-line-number" data-line-number="226"></td>
        <td id="LC226" class="blob-code blob-code-inner js-file-line">  data=<span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;header&quot;: <span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${header}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>, &quot;protected&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${protected64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;, &quot;payload&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${payload64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;, &quot;signature&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${signed64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L227" class="blob-num js-line-number" data-line-number="227"></td>
        <td id="LC227" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L228" class="blob-num js-line-number" data-line-number="228"></td>
        <td id="LC228" class="blob-code blob-code-inner js-file-line">  http_request post <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${data}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L229" class="blob-num js-line-number" data-line-number="229"></td>
        <td id="LC229" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L230" class="blob-num js-line-number" data-line-number="230"></td>
        <td id="LC230" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L231" class="blob-num js-line-number" data-line-number="231"></td>
        <td id="LC231" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Create certificate for domain(s)</span></td>
      </tr>
      <tr>
        <td id="L232" class="blob-num js-line-number" data-line-number="232"></td>
        <td id="LC232" class="blob-code blob-code-inner js-file-line"><span class="pl-en">sign_domain</span>() {</td>
      </tr>
      <tr>
        <td id="L233" class="blob-num js-line-number" data-line-number="233"></td>
        <td id="LC233" class="blob-code blob-code-inner js-file-line">  domain=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L234" class="blob-num js-line-number" data-line-number="234"></td>
        <td id="LC234" class="blob-code blob-code-inner js-file-line">  altnames=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${<span class="pl-k">*</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L235" class="blob-num js-line-number" data-line-number="235"></td>
        <td id="LC235" class="blob-code blob-code-inner js-file-line">  timestamp=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>date +%s<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L236" class="blob-num js-line-number" data-line-number="236"></td>
        <td id="LC236" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L237" class="blob-num js-line-number" data-line-number="237"></td>
        <td id="LC237" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Signing domains...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L238" class="blob-num js-line-number" data-line-number="238"></td>
        <td id="LC238" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_AUTHZ}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_CERT}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L239" class="blob-num js-line-number" data-line-number="239"></td>
        <td id="LC239" class="blob-code blob-code-inner js-file-line">    _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Certificate authority doesn&#39;t allow certificate signing<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L240" class="blob-num js-line-number" data-line-number="240"></td>
        <td id="LC240" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L241" class="blob-num js-line-number" data-line-number="241"></td>
        <td id="LC241" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L242" class="blob-num js-line-number" data-line-number="242"></td>
        <td id="LC242" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># If there is no existing certificate directory =&gt; make it</span></td>
      </tr>
      <tr>
        <td id="L243" class="blob-num js-line-number" data-line-number="243"></td>
        <td id="LC243" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">!</span> <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L244" class="blob-num js-line-number" data-line-number="244"></td>
        <td id="LC244" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Creating new directory <span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span> ...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L245" class="blob-num js-line-number" data-line-number="245"></td>
        <td id="LC245" class="blob-code blob-code-inner js-file-line">    mkdir -p <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L246" class="blob-num js-line-number" data-line-number="246"></td>
        <td id="LC246" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L247" class="blob-num js-line-number" data-line-number="247"></td>
        <td id="LC247" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L248" class="blob-num js-line-number" data-line-number="248"></td>
        <td id="LC248" class="blob-code blob-code-inner js-file-line">  privkey=<span class="pl-s"><span class="pl-pds">&quot;</span>privkey.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L249" class="blob-num js-line-number" data-line-number="249"></td>
        <td id="LC249" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># generate a new private key if we need or want one</span></td>
      </tr>
      <tr>
        <td id="L250" class="blob-num js-line-number" data-line-number="250"></td>
        <td id="LC250" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">!</span> <span class="pl-k">-f</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/privkey.pem<span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PRIVATE_KEY_RENEW}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>yes<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L251" class="blob-num js-line-number" data-line-number="251"></td>
        <td id="LC251" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Generating private key...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L252" class="blob-num js-line-number" data-line-number="252"></td>
        <td id="LC252" class="blob-code blob-code-inner js-file-line">    privkey=<span class="pl-s"><span class="pl-pds">&quot;</span>privkey-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L253" class="blob-num js-line-number" data-line-number="253"></td>
        <td id="LC253" class="blob-code blob-code-inner js-file-line">    _openssl genrsa -out <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/privkey-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${KEYSIZE}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L254" class="blob-num js-line-number" data-line-number="254"></td>
        <td id="LC254" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L255" class="blob-num js-line-number" data-line-number="255"></td>
        <td id="LC255" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L256" class="blob-num js-line-number" data-line-number="256"></td>
        <td id="LC256" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Generate signing request config and the actual signing request</span></td>
      </tr>
      <tr>
        <td id="L257" class="blob-num js-line-number" data-line-number="257"></td>
        <td id="LC257" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Generating signing request...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L258" class="blob-num js-line-number" data-line-number="258"></td>
        <td id="LC258" class="blob-code blob-code-inner js-file-line">  SAN=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L259" class="blob-num js-line-number" data-line-number="259"></td>
        <td id="LC259" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">for</span> <span class="pl-smi">altname</span> <span class="pl-k">in</span> <span class="pl-smi">${altnames}</span><span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L260" class="blob-num js-line-number" data-line-number="260"></td>
        <td id="LC260" class="blob-code blob-code-inner js-file-line">    SAN+=<span class="pl-s"><span class="pl-pds">&quot;</span>DNS:<span class="pl-smi">${altname}</span>, <span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L261" class="blob-num js-line-number" data-line-number="261"></td>
        <td id="LC261" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L262" class="blob-num js-line-number" data-line-number="262"></td>
        <td id="LC262" class="blob-code blob-code-inner js-file-line">  SAN=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${SAN<span class="pl-k">%%</span>, }</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L263" class="blob-num js-line-number" data-line-number="263"></td>
        <td id="LC263" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">local</span> tmp_openssl_cnf</td>
      </tr>
      <tr>
        <td id="L264" class="blob-num js-line-number" data-line-number="264"></td>
        <td id="LC264" class="blob-code blob-code-inner js-file-line">  tmp_openssl_cnf=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>mktemp -t XXXXXX<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L265" class="blob-num js-line-number" data-line-number="265"></td>
        <td id="LC265" class="blob-code blob-code-inner js-file-line">  cat <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${OPENSSL_CNF}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tmp_openssl_cnf}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L266" class="blob-num js-line-number" data-line-number="266"></td>
        <td id="LC266" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>[SAN]\nsubjectAltName=%s<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${SAN}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tmp_openssl_cnf}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L267" class="blob-num js-line-number" data-line-number="267"></td>
        <td id="LC267" class="blob-code blob-code-inner js-file-line">  openssl req -new -sha256 -key <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/<span class="pl-smi">${privkey}</span><span class="pl-pds">&quot;</span></span> -out <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert-<span class="pl-smi">${timestamp}</span>.csr<span class="pl-pds">&quot;</span></span> -subj <span class="pl-s"><span class="pl-pds">&quot;</span>/CN=<span class="pl-smi">${domain}</span>/<span class="pl-pds">&quot;</span></span> -reqexts SAN -config <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tmp_openssl_cnf}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L268" class="blob-num js-line-number" data-line-number="268"></td>
        <td id="LC268" class="blob-code blob-code-inner js-file-line">  rm -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${tmp_openssl_cnf}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L269" class="blob-num js-line-number" data-line-number="269"></td>
        <td id="LC269" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L270" class="blob-num js-line-number" data-line-number="270"></td>
        <td id="LC270" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Request and respond to challenges</span></td>
      </tr>
      <tr>
        <td id="L271" class="blob-num js-line-number" data-line-number="271"></td>
        <td id="LC271" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">for</span> <span class="pl-smi">altname</span> <span class="pl-k">in</span> <span class="pl-smi">${altnames}</span><span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L272" class="blob-num js-line-number" data-line-number="272"></td>
        <td id="LC272" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Ask the acme-server for new challenge token and extract them from the resulting json block</span></td>
      </tr>
      <tr>
        <td id="L273" class="blob-num js-line-number" data-line-number="273"></td>
        <td id="LC273" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Requesting challenge for <span class="pl-smi">${altname}</span>...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L274" class="blob-num js-line-number" data-line-number="274"></td>
        <td id="LC274" class="blob-code blob-code-inner js-file-line">    response=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>signed_request <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_AUTHZ}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;resource&quot;: &quot;new-authz&quot;, &quot;identifier&quot;: {&quot;type&quot;: &quot;dns&quot;, &quot;value&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${altname}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}}<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L275" class="blob-num js-line-number" data-line-number="275"></td>
        <td id="LC275" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L276" class="blob-num js-line-number" data-line-number="276"></td>
        <td id="LC276" class="blob-code blob-code-inner js-file-line">    challenges=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${response}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> grep -Eo <span class="pl-s"><span class="pl-pds">&#39;</span>&quot;challenges&quot;:[^\[]*\[[^]]*]<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L277" class="blob-num js-line-number" data-line-number="277"></td>
        <td id="LC277" class="blob-code blob-code-inner js-file-line">    repl=<span class="pl-s"><span class="pl-pds">$&#39;</span><span class="pl-cce">\n</span><span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>{<span class="pl-pds">&#39;</span></span> <span class="pl-c"># fix syntax highlighting in Vim</span></td>
      </tr>
      <tr>
        <td id="L278" class="blob-num js-line-number" data-line-number="278"></td>
        <td id="LC278" class="blob-code blob-code-inner js-file-line">    challenge=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>%s<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenges<span class="pl-k">//</span><span class="pl-cce">\{</span><span class="pl-k">/</span><span class="pl-smi">${repl}</span>}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> grep <span class="pl-cce">\&quot;</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CHALLENGETYPE}</span><span class="pl-pds">&quot;</span></span><span class="pl-cce">\&quot;</span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L279" class="blob-num js-line-number" data-line-number="279"></td>
        <td id="LC279" class="blob-code blob-code-inner js-file-line">    challenge_token=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value token <span class="pl-k">|</span> sed <span class="pl-s"><span class="pl-pds">&#39;</span>s/[^A-Za-z0-9_\-]/_/g<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L280" class="blob-num js-line-number" data-line-number="280"></td>
        <td id="LC280" class="blob-code blob-code-inner js-file-line">    challenge_uri=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value uri<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L281" class="blob-num js-line-number" data-line-number="281"></td>
        <td id="LC281" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L282" class="blob-num js-line-number" data-line-number="282"></td>
        <td id="LC282" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_uri}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L283" class="blob-num js-line-number" data-line-number="283"></td>
        <td id="LC283" class="blob-code blob-code-inner js-file-line">      _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Can&#39;t retrieve challenges (<span class="pl-smi">${response}</span>)<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L284" class="blob-num js-line-number" data-line-number="284"></td>
        <td id="LC284" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L285" class="blob-num js-line-number" data-line-number="285"></td>
        <td id="LC285" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L286" class="blob-num js-line-number" data-line-number="286"></td>
        <td id="LC286" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Challenge response consists of the challenge token and the thumbprint of our public certificate</span></td>
      </tr>
      <tr>
        <td id="L287" class="blob-num js-line-number" data-line-number="287"></td>
        <td id="LC287" class="blob-code blob-code-inner js-file-line">    keyauth=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token}</span>.<span class="pl-smi">${thumbprint}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L288" class="blob-num js-line-number" data-line-number="288"></td>
        <td id="LC288" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L289" class="blob-num js-line-number" data-line-number="289"></td>
        <td id="LC289" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">case</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CHALLENGETYPE}</span><span class="pl-pds">&quot;</span></span> in</td>
      </tr>
      <tr>
        <td id="L290" class="blob-num js-line-number" data-line-number="290"></td>
        <td id="LC290" class="blob-code blob-code-inner js-file-line">      <span class="pl-s"><span class="pl-pds">&quot;</span>http-01<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L291" class="blob-num js-line-number" data-line-number="291"></td>
        <td id="LC291" class="blob-code blob-code-inner js-file-line">        <span class="pl-c"># Store challenge response in well-known location and make world-readable (so that a webserver can access it)</span></td>
      </tr>
      <tr>
        <td id="L292" class="blob-num js-line-number" data-line-number="292"></td>
        <td id="LC292" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${WELLKNOWN}</span>/<span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L293" class="blob-num js-line-number" data-line-number="293"></td>
        <td id="LC293" class="blob-code blob-code-inner js-file-line">        chmod a+r <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${WELLKNOWN}</span>/<span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L294" class="blob-num js-line-number" data-line-number="294"></td>
        <td id="LC294" class="blob-code blob-code-inner js-file-line">        keyauth_hook=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L295" class="blob-num js-line-number" data-line-number="295"></td>
        <td id="LC295" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L296" class="blob-num js-line-number" data-line-number="296"></td>
        <td id="LC296" class="blob-code blob-code-inner js-file-line">      <span class="pl-s"><span class="pl-pds">&quot;</span>dns-01<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L297" class="blob-num js-line-number" data-line-number="297"></td>
        <td id="LC297" class="blob-code blob-code-inner js-file-line">        <span class="pl-c"># Generate DNS entry content for dns-01 validation</span></td>
      </tr>
      <tr>
        <td id="L298" class="blob-num js-line-number" data-line-number="298"></td>
        <td id="LC298" class="blob-code blob-code-inner js-file-line">        keyauth_hook=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> openssl sha -sha256 -binary <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L299" class="blob-num js-line-number" data-line-number="299"></td>
        <td id="LC299" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L300" class="blob-num js-line-number" data-line-number="300"></td>
        <td id="LC300" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">esac</span></td>
      </tr>
      <tr>
        <td id="L301" class="blob-num js-line-number" data-line-number="301"></td>
        <td id="LC301" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L302" class="blob-num js-line-number" data-line-number="302"></td>
        <td id="LC302" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Wait for hook script to deploy the challenge if used</span></td>
      </tr>
      <tr>
        <td id="L303" class="blob-num js-line-number" data-line-number="303"></td>
        <td id="LC303" class="blob-code blob-code-inner js-file-line">    [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${HOOK}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> <span class="pl-smi">${HOOK}</span> <span class="pl-s"><span class="pl-pds">&quot;</span>deploy_challenge<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${altname}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth_hook}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L304" class="blob-num js-line-number" data-line-number="304"></td>
        <td id="LC304" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L305" class="blob-num js-line-number" data-line-number="305"></td>
        <td id="LC305" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Ask the acme-server to verify our challenge and wait until it is no longer pending</span></td>
      </tr>
      <tr>
        <td id="L306" class="blob-num js-line-number" data-line-number="306"></td>
        <td id="LC306" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Responding to challenge for <span class="pl-smi">${altname}</span>...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L307" class="blob-num js-line-number" data-line-number="307"></td>
        <td id="LC307" class="blob-code blob-code-inner js-file-line">    result=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>signed_request <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_uri}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;resource&quot;: &quot;challenge&quot;, &quot;keyAuthorization&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L308" class="blob-num js-line-number" data-line-number="308"></td>
        <td id="LC308" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L309" class="blob-num js-line-number" data-line-number="309"></td>
        <td id="LC309" class="blob-code blob-code-inner js-file-line">    status=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${result}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value status<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L310" class="blob-num js-line-number" data-line-number="310"></td>
        <td id="LC310" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L311" class="blob-num js-line-number" data-line-number="311"></td>
        <td id="LC311" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">while</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${status}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>pending<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L312" class="blob-num js-line-number" data-line-number="312"></td>
        <td id="LC312" class="blob-code blob-code-inner js-file-line">      sleep 1</td>
      </tr>
      <tr>
        <td id="L313" class="blob-num js-line-number" data-line-number="313"></td>
        <td id="LC313" class="blob-code blob-code-inner js-file-line">      status=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>http_request get <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_uri}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> get_json_string_value status<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L314" class="blob-num js-line-number" data-line-number="314"></td>
        <td id="LC314" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L315" class="blob-num js-line-number" data-line-number="315"></td>
        <td id="LC315" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L316" class="blob-num js-line-number" data-line-number="316"></td>
        <td id="LC316" class="blob-code blob-code-inner js-file-line">    [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CHALLENGETYPE}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>http-01<span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> rm -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${WELLKNOWN}</span>/<span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L317" class="blob-num js-line-number" data-line-number="317"></td>
        <td id="LC317" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L318" class="blob-num js-line-number" data-line-number="318"></td>
        <td id="LC318" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Wait for hook script to clean the challenge if used</span></td>
      </tr>
      <tr>
        <td id="L319" class="blob-num js-line-number" data-line-number="319"></td>
        <td id="LC319" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${HOOK}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L320" class="blob-num js-line-number" data-line-number="320"></td>
        <td id="LC320" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">${HOOK}</span> <span class="pl-s"><span class="pl-pds">&quot;</span>clean_challenge<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${altname}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${challenge_token}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${keyauth_hook}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L321" class="blob-num js-line-number" data-line-number="321"></td>
        <td id="LC321" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L322" class="blob-num js-line-number" data-line-number="322"></td>
        <td id="LC322" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L323" class="blob-num js-line-number" data-line-number="323"></td>
        <td id="LC323" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${status}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>valid<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L324" class="blob-num js-line-number" data-line-number="324"></td>
        <td id="LC324" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Challenge is valid!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L325" class="blob-num js-line-number" data-line-number="325"></td>
        <td id="LC325" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L326" class="blob-num js-line-number" data-line-number="326"></td>
        <td id="LC326" class="blob-code blob-code-inner js-file-line">      _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Challenge is invalid! (returned: <span class="pl-smi">${status}</span>)<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L327" class="blob-num js-line-number" data-line-number="327"></td>
        <td id="LC327" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L328" class="blob-num js-line-number" data-line-number="328"></td>
        <td id="LC328" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L329" class="blob-num js-line-number" data-line-number="329"></td>
        <td id="LC329" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L330" class="blob-num js-line-number" data-line-number="330"></td>
        <td id="LC330" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Finally request certificate from the acme-server and store it in cert-${timestamp}.pem and link from cert.pem</span></td>
      </tr>
      <tr>
        <td id="L331" class="blob-num js-line-number" data-line-number="331"></td>
        <td id="LC331" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Requesting certificate...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L332" class="blob-num js-line-number" data-line-number="332"></td>
        <td id="LC332" class="blob-code blob-code-inner js-file-line">  csr64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl req -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert-<span class="pl-smi">${timestamp}</span>.csr<span class="pl-pds">&quot;</span></span> -outform DER <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L333" class="blob-num js-line-number" data-line-number="333"></td>
        <td id="LC333" class="blob-code blob-code-inner js-file-line">  crt64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>signed_request <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_NEW_CERT}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;resource&quot;: &quot;new-cert&quot;, &quot;csr&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${csr64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> openssl base64 -e<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L334" class="blob-num js-line-number" data-line-number="334"></td>
        <td id="LC334" class="blob-code blob-code-inner js-file-line">  crt_path=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L335" class="blob-num js-line-number" data-line-number="335"></td>
        <td id="LC335" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">printf</span> -- <span class="pl-s"><span class="pl-pds">&#39;</span>-----BEGIN CERTIFICATE-----\n%s\n-----END CERTIFICATE-----\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${crt64}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${crt_path}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L336" class="blob-num js-line-number" data-line-number="336"></td>
        <td id="LC336" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L337" class="blob-num js-line-number" data-line-number="337"></td>
        <td id="LC337" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Try to load the certificate to detect corruption</span></td>
      </tr>
      <tr>
        <td id="L338" class="blob-num js-line-number" data-line-number="338"></td>
        <td id="LC338" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Checking certificate...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L339" class="blob-num js-line-number" data-line-number="339"></td>
        <td id="LC339" class="blob-code blob-code-inner js-file-line">  _openssl x509 -text <span class="pl-k">&lt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${crt_path}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L340" class="blob-num js-line-number" data-line-number="340"></td>
        <td id="LC340" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L341" class="blob-num js-line-number" data-line-number="341"></td>
        <td id="LC341" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Create fullchain.pem</span></td>
      </tr>
      <tr>
        <td id="L342" class="blob-num js-line-number" data-line-number="342"></td>
        <td id="LC342" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Creating fullchain.pem...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L343" class="blob-num js-line-number" data-line-number="343"></td>
        <td id="LC343" class="blob-code blob-code-inner js-file-line">  cat <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${crt_path}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/fullchain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L344" class="blob-num js-line-number" data-line-number="344"></td>
        <td id="LC344" class="blob-code blob-code-inner js-file-line">  http_request get <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl x509 -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> -noout -text <span class="pl-k">|</span> grep <span class="pl-s"><span class="pl-pds">&#39;</span>CA Issuers - URI:<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> cut -d<span class="pl-s"><span class="pl-pds">&#39;</span>:<span class="pl-pds">&#39;</span></span> -f2-<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/chain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L345" class="blob-num js-line-number" data-line-number="345"></td>
        <td id="LC345" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> <span class="pl-k">!</span> grep -q <span class="pl-s"><span class="pl-pds">&quot;</span>BEGIN CERTIFICATE<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/chain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span><span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L346" class="blob-num js-line-number" data-line-number="346"></td>
        <td id="LC346" class="blob-code blob-code-inner js-file-line">    openssl x509 -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/chain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> -inform DER -out <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/chain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> -outform PEM</td>
      </tr>
      <tr>
        <td id="L347" class="blob-num js-line-number" data-line-number="347"></td>
        <td id="LC347" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L348" class="blob-num js-line-number" data-line-number="348"></td>
        <td id="LC348" class="blob-code blob-code-inner js-file-line">  cat <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/chain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/fullchain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L349" class="blob-num js-line-number" data-line-number="349"></td>
        <td id="LC349" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L350" class="blob-num js-line-number" data-line-number="350"></td>
        <td id="LC350" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Update symlinks</span></td>
      </tr>
      <tr>
        <td id="L351" class="blob-num js-line-number" data-line-number="351"></td>
        <td id="LC351" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${privkey}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>privkey.pem<span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> ln -sf <span class="pl-s"><span class="pl-pds">&quot;</span>privkey-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/privkey.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L352" class="blob-num js-line-number" data-line-number="352"></td>
        <td id="LC352" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L353" class="blob-num js-line-number" data-line-number="353"></td>
        <td id="LC353" class="blob-code blob-code-inner js-file-line">  ln -sf <span class="pl-s"><span class="pl-pds">&quot;</span>chain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/chain.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L354" class="blob-num js-line-number" data-line-number="354"></td>
        <td id="LC354" class="blob-code blob-code-inner js-file-line">  ln -sf <span class="pl-s"><span class="pl-pds">&quot;</span>fullchain-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/fullchain.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L355" class="blob-num js-line-number" data-line-number="355"></td>
        <td id="LC355" class="blob-code blob-code-inner js-file-line">  ln -sf <span class="pl-s"><span class="pl-pds">&quot;</span>cert-<span class="pl-smi">${timestamp}</span>.csr<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert.csr<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L356" class="blob-num js-line-number" data-line-number="356"></td>
        <td id="LC356" class="blob-code blob-code-inner js-file-line">  ln -sf <span class="pl-s"><span class="pl-pds">&quot;</span>cert-<span class="pl-smi">${timestamp}</span>.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L357" class="blob-num js-line-number" data-line-number="357"></td>
        <td id="LC357" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L358" class="blob-num js-line-number" data-line-number="358"></td>
        <td id="LC358" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Wait for hook script to clean the challenge and to deploy cert if used</span></td>
      </tr>
      <tr>
        <td id="L359" class="blob-num js-line-number" data-line-number="359"></td>
        <td id="LC359" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${HOOK}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> <span class="pl-smi">${HOOK}</span> <span class="pl-s"><span class="pl-pds">&quot;</span>deploy_cert<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${domain}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/privkey.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert.pem<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/fullchain.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L360" class="blob-num js-line-number" data-line-number="360"></td>
        <td id="LC360" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L361" class="blob-num js-line-number" data-line-number="361"></td>
        <td id="LC361" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">unset</span> challenge_token</td>
      </tr>
      <tr>
        <td id="L362" class="blob-num js-line-number" data-line-number="362"></td>
        <td id="LC362" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Done!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L363" class="blob-num js-line-number" data-line-number="363"></td>
        <td id="LC363" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L364" class="blob-num js-line-number" data-line-number="364"></td>
        <td id="LC364" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L365" class="blob-num js-line-number" data-line-number="365"></td>
        <td id="LC365" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Usage: --cron (-c)</span></td>
      </tr>
      <tr>
        <td id="L366" class="blob-num js-line-number" data-line-number="366"></td>
        <td id="LC366" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Description: Sign/renew non-existant/changed/expiring certificates.</span></td>
      </tr>
      <tr>
        <td id="L367" class="blob-num js-line-number" data-line-number="367"></td>
        <td id="LC367" class="blob-code blob-code-inner js-file-line"><span class="pl-en">command_sign_domains</span>() {</td>
      </tr>
      <tr>
        <td id="L368" class="blob-num js-line-number" data-line-number="368"></td>
        <td id="LC368" class="blob-code blob-code-inner js-file-line">  init_system</td>
      </tr>
      <tr>
        <td id="L369" class="blob-num js-line-number" data-line-number="369"></td>
        <td id="LC369" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L370" class="blob-num js-line-number" data-line-number="370"></td>
        <td id="LC370" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_DOMAIN<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L371" class="blob-num js-line-number" data-line-number="371"></td>
        <td id="LC371" class="blob-code blob-code-inner js-file-line">    DOMAINS_TXT=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>mktemp -t XXXXXX<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L372" class="blob-num js-line-number" data-line-number="372"></td>
        <td id="LC372" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">printf</span> -- <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_DOMAIN}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${DOMAINS_TXT}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L373" class="blob-num js-line-number" data-line-number="373"></td>
        <td id="LC373" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">elif</span> [[ <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/domains.txt<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L374" class="blob-num js-line-number" data-line-number="374"></td>
        <td id="LC374" class="blob-code blob-code-inner js-file-line">    DOMAINS_TXT=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/domains.txt<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L375" class="blob-num js-line-number" data-line-number="375"></td>
        <td id="LC375" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L376" class="blob-num js-line-number" data-line-number="376"></td>
        <td id="LC376" class="blob-code blob-code-inner js-file-line">    _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>domains.txt not found and --domain not given<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L377" class="blob-num js-line-number" data-line-number="377"></td>
        <td id="LC377" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L378" class="blob-num js-line-number" data-line-number="378"></td>
        <td id="LC378" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L379" class="blob-num js-line-number" data-line-number="379"></td>
        <td id="LC379" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># Generate certificates for all domains found in domains.txt. Check if existing certificate are about to expire</span></td>
      </tr>
      <tr>
        <td id="L380" class="blob-num js-line-number" data-line-number="380"></td>
        <td id="LC380" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">&lt;</span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${DOMAINS_TXT}</span><span class="pl-pds">&quot;</span></span> sed -E -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/^[[:space:]]*//g<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/[[:space:]]*$//g<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>s/[[:space:]]+/ /g<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> (grep -vE <span class="pl-s"><span class="pl-pds">&#39;</span>^(#|$)<span class="pl-pds">&#39;</span></span> <span class="pl-k">||</span> <span class="pl-c1">true</span>) <span class="pl-k">|</span> <span class="pl-k">while</span> <span class="pl-c1">read</span> -r line<span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L381" class="blob-num js-line-number" data-line-number="381"></td>
        <td id="LC381" class="blob-code blob-code-inner js-file-line">    domain=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${line}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> cut -d<span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span> -f1<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L382" class="blob-num js-line-number" data-line-number="382"></td>
        <td id="LC382" class="blob-code blob-code-inner js-file-line">    morenames=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&#39;</span>%s\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${line}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> cut -s -d<span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span> -f2-<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L383" class="blob-num js-line-number" data-line-number="383"></td>
        <td id="LC383" class="blob-code blob-code-inner js-file-line">    cert=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${BASEDIR}</span>/certs/<span class="pl-smi">${domain}</span>/cert.pem<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L384" class="blob-num js-line-number" data-line-number="384"></td>
        <td id="LC384" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L385" class="blob-num js-line-number" data-line-number="385"></td>
        <td id="LC385" class="blob-code blob-code-inner js-file-line">    force_renew=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_FORCE<span class="pl-k">:-</span>no}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L386" class="blob-num js-line-number" data-line-number="386"></td>
        <td id="LC386" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L387" class="blob-num js-line-number" data-line-number="387"></td>
        <td id="LC387" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${morenames}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span><span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L388" class="blob-num js-line-number" data-line-number="388"></td>
        <td id="LC388" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Processing <span class="pl-smi">${domain}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L389" class="blob-num js-line-number" data-line-number="389"></td>
        <td id="LC389" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L390" class="blob-num js-line-number" data-line-number="390"></td>
        <td id="LC390" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Processing <span class="pl-smi">${domain}</span> with alternative names: <span class="pl-smi">${morenames}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L391" class="blob-num js-line-number" data-line-number="391"></td>
        <td id="LC391" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L392" class="blob-num js-line-number" data-line-number="392"></td>
        <td id="LC392" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L393" class="blob-num js-line-number" data-line-number="393"></td>
        <td id="LC393" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L394" class="blob-num js-line-number" data-line-number="394"></td>
        <td id="LC394" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Checking domain name(s) of existing cert...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L395" class="blob-num js-line-number" data-line-number="395"></td>
        <td id="LC395" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L396" class="blob-num js-line-number" data-line-number="396"></td>
        <td id="LC396" class="blob-code blob-code-inner js-file-line">      certnames=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl x509 -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> -text -noout <span class="pl-k">|</span> grep DNS: <span class="pl-k">|</span> sed <span class="pl-s"><span class="pl-pds">&#39;</span>s/DNS://g<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> tr -d <span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> tr <span class="pl-s"><span class="pl-pds">&#39;</span>,<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>\n<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sort -u <span class="pl-k">|</span> tr <span class="pl-s"><span class="pl-pds">&#39;</span>\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sed <span class="pl-s"><span class="pl-pds">&#39;</span>s/ $//<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L397" class="blob-num js-line-number" data-line-number="397"></td>
        <td id="LC397" class="blob-code blob-code-inner js-file-line">      givennames=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span><span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${domain}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${morenames}</span><span class="pl-pds">&quot;</span></span><span class="pl-k">|</span> tr <span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>\n<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sort -u <span class="pl-k">|</span> tr <span class="pl-s"><span class="pl-pds">&#39;</span>\n<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sed <span class="pl-s"><span class="pl-pds">&#39;</span>s/ $//<span class="pl-pds">&#39;</span></span> <span class="pl-k">|</span> sed <span class="pl-s"><span class="pl-pds">&#39;</span>s/^ //<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L398" class="blob-num js-line-number" data-line-number="398"></td>
        <td id="LC398" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L399" class="blob-num js-line-number" data-line-number="399"></td>
        <td id="LC399" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${certnames}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${givennames}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L400" class="blob-num js-line-number" data-line-number="400"></td>
        <td id="LC400" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> unchanged.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L401" class="blob-num js-line-number" data-line-number="401"></td>
        <td id="LC401" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L402" class="blob-num js-line-number" data-line-number="402"></td>
        <td id="LC402" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> changed!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L403" class="blob-num js-line-number" data-line-number="403"></td>
        <td id="LC403" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Domain name(s) are not matching!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L404" class="blob-num js-line-number" data-line-number="404"></td>
        <td id="LC404" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Names in old certificate: <span class="pl-smi">${certnames}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L405" class="blob-num js-line-number" data-line-number="405"></td>
        <td id="LC405" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Configured names: <span class="pl-smi">${givennames}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L406" class="blob-num js-line-number" data-line-number="406"></td>
        <td id="LC406" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Forcing renew.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L407" class="blob-num js-line-number" data-line-number="407"></td>
        <td id="LC407" class="blob-code blob-code-inner js-file-line">        force_renew=<span class="pl-s"><span class="pl-pds">&quot;</span>yes<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L408" class="blob-num js-line-number" data-line-number="408"></td>
        <td id="LC408" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L409" class="blob-num js-line-number" data-line-number="409"></td>
        <td id="LC409" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L410" class="blob-num js-line-number" data-line-number="410"></td>
        <td id="LC410" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L411" class="blob-num js-line-number" data-line-number="411"></td>
        <td id="LC411" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-e</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L412" class="blob-num js-line-number" data-line-number="412"></td>
        <td id="LC412" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Checking expire date of existing cert...<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L413" class="blob-num js-line-number" data-line-number="413"></td>
        <td id="LC413" class="blob-code blob-code-inner js-file-line">      valid=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl x509 -enddate -noout -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> cut -d= -f2- <span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L414" class="blob-num js-line-number" data-line-number="414"></td>
        <td id="LC414" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L415" class="blob-num js-line-number" data-line-number="415"></td>
        <td id="LC415" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Valid till %s <span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${valid}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L416" class="blob-num js-line-number" data-line-number="416"></td>
        <td id="LC416" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">if</span> openssl x509 -checkend <span class="pl-s"><span class="pl-pds">$((</span>RENEW_DAYS <span class="pl-k">*</span> <span class="pl-c1">86400</span><span class="pl-pds">))</span></span> -noout -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span><span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L417" class="blob-num js-line-number" data-line-number="417"></td>
        <td id="LC417" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>(Longer than %d days). <span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${RENEW_DAYS}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L418" class="blob-num js-line-number" data-line-number="418"></td>
        <td id="LC418" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${force_renew}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>yes<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L419" class="blob-num js-line-number" data-line-number="419"></td>
        <td id="LC419" class="blob-code blob-code-inner js-file-line">          <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Ignoring because renew was forced!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L420" class="blob-num js-line-number" data-line-number="420"></td>
        <td id="LC420" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L421" class="blob-num js-line-number" data-line-number="421"></td>
        <td id="LC421" class="blob-code blob-code-inner js-file-line">          <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Skipping!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L422" class="blob-num js-line-number" data-line-number="422"></td>
        <td id="LC422" class="blob-code blob-code-inner js-file-line">          <span class="pl-k">continue</span></td>
      </tr>
      <tr>
        <td id="L423" class="blob-num js-line-number" data-line-number="423"></td>
        <td id="LC423" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L424" class="blob-num js-line-number" data-line-number="424"></td>
        <td id="LC424" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L425" class="blob-num js-line-number" data-line-number="425"></td>
        <td id="LC425" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>(Less than <span class="pl-smi">${RENEW_DAYS}</span> days). Renewing!<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L426" class="blob-num js-line-number" data-line-number="426"></td>
        <td id="LC426" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L427" class="blob-num js-line-number" data-line-number="427"></td>
        <td id="LC427" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L428" class="blob-num js-line-number" data-line-number="428"></td>
        <td id="LC428" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L429" class="blob-num js-line-number" data-line-number="429"></td>
        <td id="LC429" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># shellcheck disable=SC2086</span></td>
      </tr>
      <tr>
        <td id="L430" class="blob-num js-line-number" data-line-number="430"></td>
        <td id="LC430" class="blob-code blob-code-inner js-file-line">    sign_domain <span class="pl-smi">${line}</span></td>
      </tr>
      <tr>
        <td id="L431" class="blob-num js-line-number" data-line-number="431"></td>
        <td id="LC431" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L432" class="blob-num js-line-number" data-line-number="432"></td>
        <td id="LC432" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L433" class="blob-num js-line-number" data-line-number="433"></td>
        <td id="LC433" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># remove temporary domains.txt file if used</span></td>
      </tr>
      <tr>
        <td id="L434" class="blob-num js-line-number" data-line-number="434"></td>
        <td id="LC434" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_DOMAIN<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> rm -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${DOMAINS_TXT}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L435" class="blob-num js-line-number" data-line-number="435"></td>
        <td id="LC435" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L436" class="blob-num js-line-number" data-line-number="436"></td>
        <td id="LC436" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">exit</span> 0</td>
      </tr>
      <tr>
        <td id="L437" class="blob-num js-line-number" data-line-number="437"></td>
        <td id="LC437" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L438" class="blob-num js-line-number" data-line-number="438"></td>
        <td id="LC438" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L439" class="blob-num js-line-number" data-line-number="439"></td>
        <td id="LC439" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Usage: --revoke (-r) path/to/cert.pem</span></td>
      </tr>
      <tr>
        <td id="L440" class="blob-num js-line-number" data-line-number="440"></td>
        <td id="LC440" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Description: Revoke specified certificate</span></td>
      </tr>
      <tr>
        <td id="L441" class="blob-num js-line-number" data-line-number="441"></td>
        <td id="LC441" class="blob-code blob-code-inner js-file-line"><span class="pl-en">command_revoke</span>() {</td>
      </tr>
      <tr>
        <td id="L442" class="blob-num js-line-number" data-line-number="442"></td>
        <td id="LC442" class="blob-code blob-code-inner js-file-line">  init_system</td>
      </tr>
      <tr>
        <td id="L443" class="blob-num js-line-number" data-line-number="443"></td>
        <td id="LC443" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L444" class="blob-num js-line-number" data-line-number="444"></td>
        <td id="LC444" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-n</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_REVOKE_CERT}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Certificate authority doesn&#39;t allow certificate revocation.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L445" class="blob-num js-line-number" data-line-number="445"></td>
        <td id="LC445" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L446" class="blob-num js-line-number" data-line-number="446"></td>
        <td id="LC446" class="blob-code blob-code-inner js-file-line">  cert=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L447" class="blob-num js-line-number" data-line-number="447"></td>
        <td id="LC447" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span> [[ <span class="pl-k">-L</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L448" class="blob-num js-line-number" data-line-number="448"></td>
        <td id="LC448" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># follow symlink and use real certificate name (so we move the real file and not the symlink at the end)</span></td>
      </tr>
      <tr>
        <td id="L449" class="blob-num js-line-number" data-line-number="449"></td>
        <td id="LC449" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">local</span> link_target</td>
      </tr>
      <tr>
        <td id="L450" class="blob-num js-line-number" data-line-number="450"></td>
        <td id="LC450" class="blob-code blob-code-inner js-file-line">    link_target=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>readlink -n <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L451" class="blob-num js-line-number" data-line-number="451"></td>
        <td id="LC451" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${link_target}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> ^/ ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L452" class="blob-num js-line-number" data-line-number="452"></td>
        <td id="LC452" class="blob-code blob-code-inner js-file-line">      cert=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${link_target}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L453" class="blob-num js-line-number" data-line-number="453"></td>
        <td id="LC453" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L454" class="blob-num js-line-number" data-line-number="454"></td>
        <td id="LC454" class="blob-code blob-code-inner js-file-line">      cert=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>dirname <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span><span class="pl-pds">)</span></span>/<span class="pl-smi">${link_target}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L455" class="blob-num js-line-number" data-line-number="455"></td>
        <td id="LC455" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L456" class="blob-num js-line-number" data-line-number="456"></td>
        <td id="LC456" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L457" class="blob-num js-line-number" data-line-number="457"></td>
        <td id="LC457" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-f</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Could not find certificate <span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L458" class="blob-num js-line-number" data-line-number="458"></td>
        <td id="LC458" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L459" class="blob-num js-line-number" data-line-number="459"></td>
        <td id="LC459" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Revoking <span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L460" class="blob-num js-line-number" data-line-number="460"></td>
        <td id="LC460" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L461" class="blob-num js-line-number" data-line-number="461"></td>
        <td id="LC461" class="blob-code blob-code-inner js-file-line">  cert64=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>openssl x509 -in <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> -inform PEM -outform DER <span class="pl-k">|</span> urlbase64<span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L462" class="blob-num js-line-number" data-line-number="462"></td>
        <td id="LC462" class="blob-code blob-code-inner js-file-line">  response=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-s"><span class="pl-pds">$(</span>signed_request <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${CA_REVOKE_CERT}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&#39;</span>{&quot;resource&quot;: &quot;revoke-cert&quot;, &quot;certificate&quot;: &quot;<span class="pl-pds">&#39;</span></span><span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert64}</span><span class="pl-pds">&quot;</span></span><span class="pl-s"><span class="pl-pds">&#39;</span>&quot;}<span class="pl-pds">&#39;</span></span><span class="pl-pds">)</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L463" class="blob-num js-line-number" data-line-number="463"></td>
        <td id="LC463" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># if there is a problem with our revoke request _request (via signed_request) will report this and &quot;exit 1&quot; out</span></td>
      </tr>
      <tr>
        <td id="L464" class="blob-num js-line-number" data-line-number="464"></td>
        <td id="LC464" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># so if we are here, it is safe to assume the request was successful</span></td>
      </tr>
      <tr>
        <td id="L465" class="blob-num js-line-number" data-line-number="465"></td>
        <td id="LC465" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Done.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L466" class="blob-num js-line-number" data-line-number="466"></td>
        <td id="LC466" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span> + Renaming certificate to <span class="pl-smi">${cert}</span>-revoked<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L467" class="blob-num js-line-number" data-line-number="467"></td>
        <td id="LC467" class="blob-code blob-code-inner js-file-line">  mv -f <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${cert}</span>-revoked<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L468" class="blob-num js-line-number" data-line-number="468"></td>
        <td id="LC468" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L469" class="blob-num js-line-number" data-line-number="469"></td>
        <td id="LC469" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L470" class="blob-num js-line-number" data-line-number="470"></td>
        <td id="LC470" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Usage: --help (-h)</span></td>
      </tr>
      <tr>
        <td id="L471" class="blob-num js-line-number" data-line-number="471"></td>
        <td id="LC471" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Description: Show help text</span></td>
      </tr>
      <tr>
        <td id="L472" class="blob-num js-line-number" data-line-number="472"></td>
        <td id="LC472" class="blob-code blob-code-inner js-file-line"><span class="pl-en">command_help</span>() {</td>
      </tr>
      <tr>
        <td id="L473" class="blob-num js-line-number" data-line-number="473"></td>
        <td id="LC473" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Usage: %s [-h] [command [argument]] [parameter [argument]] [parameter [argument]] ...\n\n<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${0}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L474" class="blob-num js-line-number" data-line-number="474"></td>
        <td id="LC474" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Default command: help\n\n<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L475" class="blob-num js-line-number" data-line-number="475"></td>
        <td id="LC475" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Commands:<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L476" class="blob-num js-line-number" data-line-number="476"></td>
        <td id="LC476" class="blob-code blob-code-inner js-file-line">  grep -e <span class="pl-s"><span class="pl-pds">&#39;</span>^[[:space:]]*# Usage:<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>^[[:space:]]*# Description:<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>^command_.*()[[:space:]]*{<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${0}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k">while</span> <span class="pl-c1">read</span> -r usage<span class="pl-k">;</span> <span class="pl-c1">read</span> -r description<span class="pl-k">;</span> <span class="pl-c1">read</span> -r <span class="pl-c1">command</span><span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L477" class="blob-num js-line-number" data-line-number="477"></td>
        <td id="LC477" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">!</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${usage}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> Usage ]] <span class="pl-k">||</span> [[ <span class="pl-k">!</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${description}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> Description ]] <span class="pl-k">||</span> [[ <span class="pl-k">!</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${command}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> ^command_ ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L478" class="blob-num js-line-number" data-line-number="478"></td>
        <td id="LC478" class="blob-code blob-code-inner js-file-line">      _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Error generating help text.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L479" class="blob-num js-line-number" data-line-number="479"></td>
        <td id="LC479" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L480" class="blob-num js-line-number" data-line-number="480"></td>
        <td id="LC480" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span> %-32s %s\n<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${usage<span class="pl-k">##</span><span class="pl-s"><span class="pl-pds">&quot;</span># Usage: <span class="pl-pds">&quot;</span></span>}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${description<span class="pl-k">##</span><span class="pl-s"><span class="pl-pds">&quot;</span># Description: <span class="pl-pds">&quot;</span></span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L481" class="blob-num js-line-number" data-line-number="481"></td>
        <td id="LC481" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L482" class="blob-num js-line-number" data-line-number="482"></td>
        <td id="LC482" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">printf</span> -- <span class="pl-s"><span class="pl-pds">&quot;</span>\nParameters:\n<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L483" class="blob-num js-line-number" data-line-number="483"></td>
        <td id="LC483" class="blob-code blob-code-inner js-file-line">  grep -E -e <span class="pl-s"><span class="pl-pds">&#39;</span>^[[:space:]]*# PARAM_Usage:<span class="pl-pds">&#39;</span></span> -e <span class="pl-s"><span class="pl-pds">&#39;</span>^[[:space:]]*# PARAM_Description:<span class="pl-pds">&#39;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${0}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k">while</span> <span class="pl-c1">read</span> -r usage<span class="pl-k">;</span> <span class="pl-c1">read</span> -r description<span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L484" class="blob-num js-line-number" data-line-number="484"></td>
        <td id="LC484" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">!</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${usage}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> Usage ]] <span class="pl-k">||</span> [[ <span class="pl-k">!</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${description}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=~</span> Description ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L485" class="blob-num js-line-number" data-line-number="485"></td>
        <td id="LC485" class="blob-code blob-code-inner js-file-line">      _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Error generating help text.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L486" class="blob-num js-line-number" data-line-number="486"></td>
        <td id="LC486" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L487" class="blob-num js-line-number" data-line-number="487"></td>
        <td id="LC487" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">printf</span> <span class="pl-s"><span class="pl-pds">&quot;</span> %-32s %s\n<span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${usage<span class="pl-k">##</span><span class="pl-s"><span class="pl-pds">&quot;</span># PARAM_Usage: <span class="pl-pds">&quot;</span></span>}</span><span class="pl-pds">&quot;</span></span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${description<span class="pl-k">##</span><span class="pl-s"><span class="pl-pds">&quot;</span># PARAM_Description: <span class="pl-pds">&quot;</span></span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L488" class="blob-num js-line-number" data-line-number="488"></td>
        <td id="LC488" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L489" class="blob-num js-line-number" data-line-number="489"></td>
        <td id="LC489" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L490" class="blob-num js-line-number" data-line-number="490"></td>
        <td id="LC490" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L491" class="blob-num js-line-number" data-line-number="491"></td>
        <td id="LC491" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Usage: --env (-e)</span></td>
      </tr>
      <tr>
        <td id="L492" class="blob-num js-line-number" data-line-number="492"></td>
        <td id="LC492" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Description: Output configuration variables for use in other scripts</span></td>
      </tr>
      <tr>
        <td id="L493" class="blob-num js-line-number" data-line-number="493"></td>
        <td id="LC493" class="blob-code blob-code-inner js-file-line"><span class="pl-en">command_env</span>() {</td>
      </tr>
      <tr>
        <td id="L494" class="blob-num js-line-number" data-line-number="494"></td>
        <td id="LC494" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span># letsencrypt.sh configuration<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L495" class="blob-num js-line-number" data-line-number="495"></td>
        <td id="LC495" class="blob-code blob-code-inner js-file-line">  load_config</td>
      </tr>
      <tr>
        <td id="L496" class="blob-num js-line-number" data-line-number="496"></td>
        <td id="LC496" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">typeset</span> -p CA LICENSE CHALLENGETYPE HOOK RENEW_DAYS PRIVATE_KEY KEYSIZE WELLKNOWN PRIVATE_KEY_RENEW OPENSSL_CNF CONTACT_EMAIL LOCKFILE</td>
      </tr>
      <tr>
        <td id="L497" class="blob-num js-line-number" data-line-number="497"></td>
        <td id="LC497" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L498" class="blob-num js-line-number" data-line-number="498"></td>
        <td id="LC498" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L499" class="blob-num js-line-number" data-line-number="499"></td>
        <td id="LC499" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Main method (parses script arguments and calls command_* methods)</span></td>
      </tr>
      <tr>
        <td id="L500" class="blob-num js-line-number" data-line-number="500"></td>
        <td id="LC500" class="blob-code blob-code-inner js-file-line"><span class="pl-en">main</span>() {</td>
      </tr>
      <tr>
        <td id="L501" class="blob-num js-line-number" data-line-number="501"></td>
        <td id="LC501" class="blob-code blob-code-inner js-file-line">  COMMAND=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L502" class="blob-num js-line-number" data-line-number="502"></td>
        <td id="LC502" class="blob-code blob-code-inner js-file-line">  <span class="pl-en">set_command</span>() {</td>
      </tr>
      <tr>
        <td id="L503" class="blob-num js-line-number" data-line-number="503"></td>
        <td id="LC503" class="blob-code blob-code-inner js-file-line">    [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${COMMAND}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">||</span> _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Only one command can be executed at a time. See help (-h) for more information.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L504" class="blob-num js-line-number" data-line-number="504"></td>
        <td id="LC504" class="blob-code blob-code-inner js-file-line">    COMMAND=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L505" class="blob-num js-line-number" data-line-number="505"></td>
        <td id="LC505" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L506" class="blob-num js-line-number" data-line-number="506"></td>
        <td id="LC506" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L507" class="blob-num js-line-number" data-line-number="507"></td>
        <td id="LC507" class="blob-code blob-code-inner js-file-line">  <span class="pl-en">check_parameters</span>() {</td>
      </tr>
      <tr>
        <td id="L508" class="blob-num js-line-number" data-line-number="508"></td>
        <td id="LC508" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L509" class="blob-num js-line-number" data-line-number="509"></td>
        <td id="LC509" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>The specified command requires additional parameters. See help:<span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L510" class="blob-num js-line-number" data-line-number="510"></td>
        <td id="LC510" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">echo</span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L511" class="blob-num js-line-number" data-line-number="511"></td>
        <td id="LC511" class="blob-code blob-code-inner js-file-line">      command_help <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L512" class="blob-num js-line-number" data-line-number="512"></td>
        <td id="LC512" class="blob-code blob-code-inner js-file-line">      <span class="pl-c1">exit</span> 1</td>
      </tr>
      <tr>
        <td id="L513" class="blob-num js-line-number" data-line-number="513"></td>
        <td id="LC513" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">elif</span> [[ <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:</span>0<span class="pl-k">:</span>1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>-<span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L514" class="blob-num js-line-number" data-line-number="514"></td>
        <td id="LC514" class="blob-code blob-code-inner js-file-line">      _exiterr <span class="pl-s"><span class="pl-pds">&quot;</span>Invalid argument: <span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L515" class="blob-num js-line-number" data-line-number="515"></td>
        <td id="LC515" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L516" class="blob-num js-line-number" data-line-number="516"></td>
        <td id="LC516" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L517" class="blob-num js-line-number" data-line-number="517"></td>
        <td id="LC517" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L518" class="blob-num js-line-number" data-line-number="518"></td>
        <td id="LC518" class="blob-code blob-code-inner js-file-line">  [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${<span class="pl-k">@</span>}</span><span class="pl-pds">&quot;</span></span> ]] <span class="pl-k">&amp;&amp;</span> <span class="pl-c1">eval</span> <span class="pl-c1">set</span> -- <span class="pl-s"><span class="pl-pds">&quot;</span>--help<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L519" class="blob-num js-line-number" data-line-number="519"></td>
        <td id="LC519" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L520" class="blob-num js-line-number" data-line-number="520"></td>
        <td id="LC520" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">while</span> <span class="pl-s"><span class="pl-pds">((</span> &quot;<span class="pl-smi">${<span class="pl-k">#</span>}</span>&quot; <span class="pl-pds">))</span></span><span class="pl-k">;</span> <span class="pl-k">do</span></td>
      </tr>
      <tr>
        <td id="L521" class="blob-num js-line-number" data-line-number="521"></td>
        <td id="LC521" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">case</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> in</td>
      </tr>
      <tr>
        <td id="L522" class="blob-num js-line-number" data-line-number="522"></td>
        <td id="LC522" class="blob-code blob-code-inner js-file-line">      --help|-h)</td>
      </tr>
      <tr>
        <td id="L523" class="blob-num js-line-number" data-line-number="523"></td>
        <td id="LC523" class="blob-code blob-code-inner js-file-line">        command_help</td>
      </tr>
      <tr>
        <td id="L524" class="blob-num js-line-number" data-line-number="524"></td>
        <td id="LC524" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">exit</span> 0</td>
      </tr>
      <tr>
        <td id="L525" class="blob-num js-line-number" data-line-number="525"></td>
        <td id="LC525" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L526" class="blob-num js-line-number" data-line-number="526"></td>
        <td id="LC526" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L527" class="blob-num js-line-number" data-line-number="527"></td>
        <td id="LC527" class="blob-code blob-code-inner js-file-line">      --env|-e)</td>
      </tr>
      <tr>
        <td id="L528" class="blob-num js-line-number" data-line-number="528"></td>
        <td id="LC528" class="blob-code blob-code-inner js-file-line">        set_command env</td>
      </tr>
      <tr>
        <td id="L529" class="blob-num js-line-number" data-line-number="529"></td>
        <td id="LC529" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L530" class="blob-num js-line-number" data-line-number="530"></td>
        <td id="LC530" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L531" class="blob-num js-line-number" data-line-number="531"></td>
        <td id="LC531" class="blob-code blob-code-inner js-file-line">      --cron|-c)</td>
      </tr>
      <tr>
        <td id="L532" class="blob-num js-line-number" data-line-number="532"></td>
        <td id="LC532" class="blob-code blob-code-inner js-file-line">        set_command sign_domains</td>
      </tr>
      <tr>
        <td id="L533" class="blob-num js-line-number" data-line-number="533"></td>
        <td id="LC533" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L534" class="blob-num js-line-number" data-line-number="534"></td>
        <td id="LC534" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L535" class="blob-num js-line-number" data-line-number="535"></td>
        <td id="LC535" class="blob-code blob-code-inner js-file-line">      --revoke|-r)</td>
      </tr>
      <tr>
        <td id="L536" class="blob-num js-line-number" data-line-number="536"></td>
        <td id="LC536" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L537" class="blob-num js-line-number" data-line-number="537"></td>
        <td id="LC537" class="blob-code blob-code-inner js-file-line">        set_command revoke</td>
      </tr>
      <tr>
        <td id="L538" class="blob-num js-line-number" data-line-number="538"></td>
        <td id="LC538" class="blob-code blob-code-inner js-file-line">        check_parameters <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L539" class="blob-num js-line-number" data-line-number="539"></td>
        <td id="LC539" class="blob-code blob-code-inner js-file-line">        PARAM_REVOKECERT=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L540" class="blob-num js-line-number" data-line-number="540"></td>
        <td id="LC540" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L541" class="blob-num js-line-number" data-line-number="541"></td>
        <td id="LC541" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L542" class="blob-num js-line-number" data-line-number="542"></td>
        <td id="LC542" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Usage: --domain (-d) domain.tld</span></td>
      </tr>
      <tr>
        <td id="L543" class="blob-num js-line-number" data-line-number="543"></td>
        <td id="LC543" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Description: Use specified domain name(s) instead of domains.txt entry (one certificate!)</span></td>
      </tr>
      <tr>
        <td id="L544" class="blob-num js-line-number" data-line-number="544"></td>
        <td id="LC544" class="blob-code blob-code-inner js-file-line">      --domain|-d)</td>
      </tr>
      <tr>
        <td id="L545" class="blob-num js-line-number" data-line-number="545"></td>
        <td id="LC545" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L546" class="blob-num js-line-number" data-line-number="546"></td>
        <td id="LC546" class="blob-code blob-code-inner js-file-line">        check_parameters <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L547" class="blob-num js-line-number" data-line-number="547"></td>
        <td id="LC547" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">if</span> [[ <span class="pl-k">-z</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_DOMAIN<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span> ]]<span class="pl-k">;</span> <span class="pl-k">then</span></td>
      </tr>
      <tr>
        <td id="L548" class="blob-num js-line-number" data-line-number="548"></td>
        <td id="LC548" class="blob-code blob-code-inner js-file-line">          PARAM_DOMAIN=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L549" class="blob-num js-line-number" data-line-number="549"></td>
        <td id="LC549" class="blob-code blob-code-inner js-file-line">        <span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L550" class="blob-num js-line-number" data-line-number="550"></td>
        <td id="LC550" class="blob-code blob-code-inner js-file-line">          PARAM_DOMAIN=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_DOMAIN}</span> <span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L551" class="blob-num js-line-number" data-line-number="551"></td>
        <td id="LC551" class="blob-code blob-code-inner js-file-line">         <span class="pl-k">fi</span></td>
      </tr>
      <tr>
        <td id="L552" class="blob-num js-line-number" data-line-number="552"></td>
        <td id="LC552" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L553" class="blob-num js-line-number" data-line-number="553"></td>
        <td id="LC553" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L554" class="blob-num js-line-number" data-line-number="554"></td>
        <td id="LC554" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L555" class="blob-num js-line-number" data-line-number="555"></td>
        <td id="LC555" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Usage: --force (-x)</span></td>
      </tr>
      <tr>
        <td id="L556" class="blob-num js-line-number" data-line-number="556"></td>
        <td id="LC556" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Description: Force renew of certificate even if it is longer valid than value in RENEW_DAYS</span></td>
      </tr>
      <tr>
        <td id="L557" class="blob-num js-line-number" data-line-number="557"></td>
        <td id="LC557" class="blob-code blob-code-inner js-file-line">      --force|-x)</td>
      </tr>
      <tr>
        <td id="L558" class="blob-num js-line-number" data-line-number="558"></td>
        <td id="LC558" class="blob-code blob-code-inner js-file-line">        PARAM_FORCE=<span class="pl-s"><span class="pl-pds">&quot;</span>yes<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L559" class="blob-num js-line-number" data-line-number="559"></td>
        <td id="LC559" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L560" class="blob-num js-line-number" data-line-number="560"></td>
        <td id="LC560" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L561" class="blob-num js-line-number" data-line-number="561"></td>
        <td id="LC561" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Usage: --privkey (-p) path/to/key.pem</span></td>
      </tr>
      <tr>
        <td id="L562" class="blob-num js-line-number" data-line-number="562"></td>
        <td id="LC562" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Description: Use specified private key instead of account key (useful for revocation)</span></td>
      </tr>
      <tr>
        <td id="L563" class="blob-num js-line-number" data-line-number="563"></td>
        <td id="LC563" class="blob-code blob-code-inner js-file-line">      --privkey|-p)</td>
      </tr>
      <tr>
        <td id="L564" class="blob-num js-line-number" data-line-number="564"></td>
        <td id="LC564" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L565" class="blob-num js-line-number" data-line-number="565"></td>
        <td id="LC565" class="blob-code blob-code-inner js-file-line">        check_parameters <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L566" class="blob-num js-line-number" data-line-number="566"></td>
        <td id="LC566" class="blob-code blob-code-inner js-file-line">        PARAM_PRIVATE_KEY=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L567" class="blob-num js-line-number" data-line-number="567"></td>
        <td id="LC567" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L568" class="blob-num js-line-number" data-line-number="568"></td>
        <td id="LC568" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L569" class="blob-num js-line-number" data-line-number="569"></td>
        <td id="LC569" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Usage: --config (-f) path/to/config.sh</span></td>
      </tr>
      <tr>
        <td id="L570" class="blob-num js-line-number" data-line-number="570"></td>
        <td id="LC570" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Description: Use specified config file</span></td>
      </tr>
      <tr>
        <td id="L571" class="blob-num js-line-number" data-line-number="571"></td>
        <td id="LC571" class="blob-code blob-code-inner js-file-line">      --config|-f)</td>
      </tr>
      <tr>
        <td id="L572" class="blob-num js-line-number" data-line-number="572"></td>
        <td id="LC572" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L573" class="blob-num js-line-number" data-line-number="573"></td>
        <td id="LC573" class="blob-code blob-code-inner js-file-line">        check_parameters <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L574" class="blob-num js-line-number" data-line-number="574"></td>
        <td id="LC574" class="blob-code blob-code-inner js-file-line">        CONFIG=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L575" class="blob-num js-line-number" data-line-number="575"></td>
        <td id="LC575" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L576" class="blob-num js-line-number" data-line-number="576"></td>
        <td id="LC576" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L577" class="blob-num js-line-number" data-line-number="577"></td>
        <td id="LC577" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Usage: --hook (-k) path/to/hook.sh</span></td>
      </tr>
      <tr>
        <td id="L578" class="blob-num js-line-number" data-line-number="578"></td>
        <td id="LC578" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Description: Use specified script for hooks</span></td>
      </tr>
      <tr>
        <td id="L579" class="blob-num js-line-number" data-line-number="579"></td>
        <td id="LC579" class="blob-code blob-code-inner js-file-line">      --hook|-k)</td>
      </tr>
      <tr>
        <td id="L580" class="blob-num js-line-number" data-line-number="580"></td>
        <td id="LC580" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L581" class="blob-num js-line-number" data-line-number="581"></td>
        <td id="LC581" class="blob-code blob-code-inner js-file-line">        check_parameters <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L582" class="blob-num js-line-number" data-line-number="582"></td>
        <td id="LC582" class="blob-code blob-code-inner js-file-line">        PARAM_HOOK=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L583" class="blob-num js-line-number" data-line-number="583"></td>
        <td id="LC583" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L584" class="blob-num js-line-number" data-line-number="584"></td>
        <td id="LC584" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L585" class="blob-num js-line-number" data-line-number="585"></td>
        <td id="LC585" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Usage: --challenge (-t) http-01|dns-01</span></td>
      </tr>
      <tr>
        <td id="L586" class="blob-num js-line-number" data-line-number="586"></td>
        <td id="LC586" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># PARAM_Description: Which challenge should be used? Currently http-01 and dns-01 are supported</span></td>
      </tr>
      <tr>
        <td id="L587" class="blob-num js-line-number" data-line-number="587"></td>
        <td id="LC587" class="blob-code blob-code-inner js-file-line">      --challenge|-t)</td>
      </tr>
      <tr>
        <td id="L588" class="blob-num js-line-number" data-line-number="588"></td>
        <td id="LC588" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L589" class="blob-num js-line-number" data-line-number="589"></td>
        <td id="LC589" class="blob-code blob-code-inner js-file-line">        check_parameters <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1<span class="pl-k">:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L590" class="blob-num js-line-number" data-line-number="590"></td>
        <td id="LC590" class="blob-code blob-code-inner js-file-line">        PARAM_CHALLENGETYPE=<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L591" class="blob-num js-line-number" data-line-number="591"></td>
        <td id="LC591" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L592" class="blob-num js-line-number" data-line-number="592"></td>
        <td id="LC592" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L593" class="blob-num js-line-number" data-line-number="593"></td>
        <td id="LC593" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">*</span>)</td>
      </tr>
      <tr>
        <td id="L594" class="blob-num js-line-number" data-line-number="594"></td>
        <td id="LC594" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Unknown parameter detected: <span class="pl-smi">${1}</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L595" class="blob-num js-line-number" data-line-number="595"></td>
        <td id="LC595" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">echo</span> <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L596" class="blob-num js-line-number" data-line-number="596"></td>
        <td id="LC596" class="blob-code blob-code-inner js-file-line">        command_help <span class="pl-k">&gt;&amp;2</span></td>
      </tr>
      <tr>
        <td id="L597" class="blob-num js-line-number" data-line-number="597"></td>
        <td id="LC597" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">exit</span> 1</td>
      </tr>
      <tr>
        <td id="L598" class="blob-num js-line-number" data-line-number="598"></td>
        <td id="LC598" class="blob-code blob-code-inner js-file-line">        ;;</td>
      </tr>
      <tr>
        <td id="L599" class="blob-num js-line-number" data-line-number="599"></td>
        <td id="LC599" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">esac</span></td>
      </tr>
      <tr>
        <td id="L600" class="blob-num js-line-number" data-line-number="600"></td>
        <td id="LC600" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L601" class="blob-num js-line-number" data-line-number="601"></td>
        <td id="LC601" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">shift</span> 1</td>
      </tr>
      <tr>
        <td id="L602" class="blob-num js-line-number" data-line-number="602"></td>
        <td id="LC602" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">done</span></td>
      </tr>
      <tr>
        <td id="L603" class="blob-num js-line-number" data-line-number="603"></td>
        <td id="LC603" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L604" class="blob-num js-line-number" data-line-number="604"></td>
        <td id="LC604" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">case</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${COMMAND}</span><span class="pl-pds">&quot;</span></span> in</td>
      </tr>
      <tr>
        <td id="L605" class="blob-num js-line-number" data-line-number="605"></td>
        <td id="LC605" class="blob-code blob-code-inner js-file-line">    env) command_env;;</td>
      </tr>
      <tr>
        <td id="L606" class="blob-num js-line-number" data-line-number="606"></td>
        <td id="LC606" class="blob-code blob-code-inner js-file-line">    sign_domains) command_sign_domains;;</td>
      </tr>
      <tr>
        <td id="L607" class="blob-num js-line-number" data-line-number="607"></td>
        <td id="LC607" class="blob-code blob-code-inner js-file-line">    revoke) command_revoke <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${PARAM_REVOKECERT}</span><span class="pl-pds">&quot;</span></span>;;</td>
      </tr>
      <tr>
        <td id="L608" class="blob-num js-line-number" data-line-number="608"></td>
        <td id="LC608" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">*</span>) command_help<span class="pl-k">;</span> exit1;;</td>
      </tr>
      <tr>
        <td id="L609" class="blob-num js-line-number" data-line-number="609"></td>
        <td id="LC609" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">esac</span></td>
      </tr>
      <tr>
        <td id="L610" class="blob-num js-line-number" data-line-number="610"></td>
        <td id="LC610" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L611" class="blob-num js-line-number" data-line-number="611"></td>
        <td id="LC611" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L612" class="blob-num js-line-number" data-line-number="612"></td>
        <td id="LC612" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Check for missing dependencies</span></td>
      </tr>
      <tr>
        <td id="L613" class="blob-num js-line-number" data-line-number="613"></td>
        <td id="LC613" class="blob-code blob-code-inner js-file-line">check_dependencies</td>
      </tr>
      <tr>
        <td id="L614" class="blob-num js-line-number" data-line-number="614"></td>
        <td id="LC614" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L615" class="blob-num js-line-number" data-line-number="615"></td>
        <td id="LC615" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Run script</span></td>
      </tr>
      <tr>
        <td id="L616" class="blob-num js-line-number" data-line-number="616"></td>
        <td id="LC616" class="blob-code blob-code-inner js-file-line">main <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-smi">${<span class="pl-k">@:-</span>}</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

  </div>
  <div class="modal-backdrop"></div>
</div>

    </div>
  </div>

    </div>

        <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span aria-hidden="true" class="mega-octicon octicon-mark-github" title="GitHub "></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2016 <span title="0.05507s from github-fe139-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span aria-hidden="true" class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span aria-hidden="true" class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-ef8eb4a89ee9f3c8b7613307fe589a8f5705817f7cee27bec51ce5e963234abf.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-119bc4b0e461ed40cd8b8110904de550f7886bc02efd25109df2740328bae70d.js"></script>
      
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span aria-hidden="true" class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>

