
  

  


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <title>ORM/lesson-01/solution/rakefile.rb at master from morganp's Code-Dojo - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="http://github.com/fluidicon.png" title="GitHub" />

    <link href="http://assets2.github.com/stylesheets/bundle_common.css?935bbdff6dd3f65d860d46e4de77e4ea817dc684" media="screen" rel="stylesheet" type="text/css" />
<link href="http://assets1.github.com/stylesheets/bundle_github.css?935bbdff6dd3f65d860d46e4de77e4ea817dc684" media="screen" rel="stylesheet" type="text/css" />

    <script type="text/javascript" charset="utf-8">
      var GitHub = {}
      var github_user = 'morganp'
      
    </script>
    <script src="http://assets3.github.com/javascripts/jquery/jquery-1.4.2.min.js?935bbdff6dd3f65d860d46e4de77e4ea817dc684" type="text/javascript"></script>
    <script src="http://assets0.github.com/javascripts/bundle_common.js?935bbdff6dd3f65d860d46e4de77e4ea817dc684" type="text/javascript"></script>
<script src="http://assets0.github.com/javascripts/bundle_github.js?935bbdff6dd3f65d860d46e4de77e4ea817dc684" type="text/javascript"></script>

        <script type="text/javascript" charset="utf-8">
      GitHub.spy({
        repo: "morganp/Code-Dojo"
      })
    </script>

    
  
    
  

  <link href="http://github.com/morganp/Code-Dojo/commits/master.atom" rel="alternate" title="Recent Commits to Code-Dojo:master" type="application/atom+xml" />

        <meta name="description" content="Code Dojo Examples" />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "morganp/Code-Dojo";
      GitHub.currentRef = 'master';
    </script>
  

            <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-3769691-2']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
      })();
    </script>

  </head>

  

  <body class="logged_in ">
    

    
      <script type="text/javascript">
        var _kmq = _kmq || [];
        function _kms(u){
          var s = document.createElement('script'); var f = document.getElementsByTagName('script')[0]; s.type = 'text/javascript'; s.async = true;
          s.src = u; f.parentNode.insertBefore(s, f);
        }
        _kms('//i.kissmetrics.com/i.js');_kms('//doug1izaerwt3.cloudfront.net/406e8bf3a2b8846ead55afb3cfaf6664523e3a54.1.js');
      </script>
    

    

    

    

    <div class="subnavd" id="main">
      <div id="header" class="true">
        
          <a class="logo boring" href="https://github.com/">
            <img src="/images/modules/header/logov3.png?changed" class="default" alt="github" />
            <![if !IE]>
            <img src="/images/modules/header/logov3-hover.png" class="hover" alt="github" />
            <![endif]>
          </a>
        
        
          






  
    <div class="userbox">
      <div class="avatarname">
        <a href="http://github.com/morganp"><img src="http://www.gravatar.com/avatar/a2a704981636fcbc990abf75a0c7d5e7?s=140&d=http%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="20" height="20"  /></a>
        <a href="http://github.com/morganp" class="name">morganp</a>

        
        
          <a href="http://github.com/inbox/notifications" class="unread_count notifications_count new tooltipped downwards js-notification-count" title="Unread Notifications">2</a>
        
      </div>
      <ul class="usernav">
        <li><a href="https://github.com/">Dashboard</a></li>
        <li>
          
          <a href="https://github.com/inbox">Inbox</a>
          <a href="https://github.com/inbox" class="unread_count ">0</a>
        </li>
        <li><a href="https://github.com/account">Account Settings</a></li>
                        <li><a href="/logout">Log Out</a></li>
      </ul>
    </div><!-- /.userbox -->
  


        
        <div class="topsearch">
  
    <form action="/search" id="top_search_form" method="get">
      <a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search">Advanced Search</a>
      <input type="search" class="search my_repos_autocompleter" name="q" results="5" placeholder="Search&hellip;" /> <input type="submit" value="Search" class="button" />
      <input type="hidden" name="type" value="Everything" />
      <input type="hidden" name="repo" value="" />
      <input type="hidden" name="langOverride" value="" />
      <input type="hidden" name="start_value" value="1" />
    </form>
    <ul class="nav">
      <li><a href="/explore">Explore GitHub</a></li>
      <li><a href="http://gist.github.com">Gist</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="http://help.github.com">Help</a></li>
    </ul>
  
</div>

      </div>

      
      
        
    <div class="site">
      <div class="pagehead repohead vis-public   ">
        <h1>
          <a href="/morganp">morganp</a> / <strong><a href="http://github.com/morganp/Code-Dojo">Code-Dojo</a></strong>
          
          
        </h1>

        
    <ul class="actions">
      

      
        <li class="for-owner" style="display:none"><a href="https://github.com/morganp/Code-Dojo/edit" class="minibutton btn-admin "><span><span class="icon"></span>Admin</span></a></li>
        <li>
          <a href="/morganp/Code-Dojo/toggle_watch" class="minibutton btn-watch " id="watch_button" style="display:none"><span><span class="icon"></span>Watch</span></a>
          <a href="/morganp/Code-Dojo/toggle_watch" class="minibutton btn-watch " id="unwatch_button" style="display:none"><span><span class="icon"></span>Unwatch</span></a>
        </li>
        
          
            <li class="for-notforked" style="display:none"><a href="/morganp/Code-Dojo/fork" class="minibutton btn-fork " id="fork_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '3afe551c26d99f12e8974d11dadbbfbd21053acf'); f.appendChild(s);f.submit();return false;"><span><span class="icon"></span>Fork</span></a></li>
            <li class="for-hasfork" style="display:none"><a href="#" class="minibutton btn-fork " id="your_fork_button"><span><span class="icon"></span>Your Fork</span></a></li>
          

          
          <li id="pull_request_item" class='ospr' style="display:none"><a href="/morganp/Code-Dojo/pull_request/" class="minibutton btn-pull-request "><span><span class="icon"></span>Pull Request</span></a></li>
          

          <li><a href="#" class="minibutton btn-download " id="download_button"><span><span class="icon"></span>Download Source</span></a></li>
        
      
      
      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers"><a href="/morganp/Code-Dojo/watchers" title="Watchers" class="tooltipped downwards">1</a></li>
          <li class="forks"><a href="/morganp/Code-Dojo/network" title="Forks" class="tooltipped downwards">1</a></li>
        </ul>
      </li>
    </ul>


        
  <ul class="tabs">
    <li><a href="http://github.com/morganp/Code-Dojo/tree/master" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="http://github.com/morganp/Code-Dojo/commits/master" highlight="repo_commits">Commits</a></li>

    
    <li><a href="/morganp/Code-Dojo/network" highlight="repo_network">Network (1)</a></li>

    
      <li><a href="/morganp/Code-Dojo/forkqueue" highlight="repo_fork_queue">Fork Queue</a></li>
    

    
      
      <li><a href="/morganp/Code-Dojo/issues" highlight="issues">Issues (0)</a></li>
    

    
      
      <li><a href="/morganp/Code-Dojo/downloads">Downloads (0)</a></li>
    

            
      <li><a href="http://wiki.github.com/morganp/Code-Dojo/">Wiki (1)</a></li>
      
    <li><a href="/morganp/Code-Dojo/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards" >
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
  </ul>

  <div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
  <div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

  <div class="subnav-bar">
  
  <ul>
    <li>
      <a href="#" class="dropdown">Switch Branches (1)</a>
      <ul>
        
          
            <li><strong>master &#x2713;</strong></li>
            
      </ul>
    </li>
    <li>
      <a href="#" class="dropdown defunct">Switch Tags (0)</a>
      
    </li>
    <li>
    
    <a href="/morganp/Code-Dojo/branches" class="manage">Branch List</a>
    
    </li>
  </ul>
</div>

  
  
  
  
  
  



        
    <div id="repo_details" class="metabox clearfix">
      <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request&hellip;</div>

      

      <div id="repository_description" rel="repository_description_edit">
        
          <p>Code Dojo Examples
            <span id="read_more" style="display:none">&mdash; <a href="#readme">Read more</a></span>
          </p>
        
      </div>
      <div id="repository_description_edit" style="display:none;" class="inline-edit">
        <form action="/morganp/Code-Dojo/edit/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="3afe551c26d99f12e8974d11dadbbfbd21053acf" /></div>
          <input type="hidden" name="field" value="repository_description">
          <input type="text" class="textfield" name="value" value="Code Dojo Examples">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      
      <div class="repository-homepage" id="repository_homepage" rel="repository_homepage_edit">
        <p><a href="http://" rel="nofollow"></a></p>
      </div>
      <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
        <form action="/morganp/Code-Dojo/edit/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="3afe551c26d99f12e8974d11dadbbfbd21053acf" /></div>
          <input type="hidden" name="field" value="repository_homepage">
          <input type="text" class="textfield" name="value" value="">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      <div class="rule "></div>

            <div id="url_box" class="url-box">
        <ul class="clone-urls">
          
            
              <li id="private_clone_url"><a href="git@github.com:morganp/Code-Dojo.git" data-permissions="Read+Write">SSH</a></li>
            
            <li id="http_clone_url"><a href="https://morganp@github.com/morganp/Code-Dojo.git" data-permissions="Read+Write">HTTP</a></li>
            <li id="public_clone_url"><a href="git://github.com/morganp/Code-Dojo.git" data-permissions="Read-Only">Git Read-Only</a></li>
          
        </ul>
        <input type="text" spellcheck="false" id="url_field" class="url-field" />
              <span style="display:none" id="url_box_clippy"></span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="http://assets3.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="http://assets3.github.com/flash/clippy.swf?v5"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=url_box_clippy&amp;copied=&amp;copyto="
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      </span>

        <p id="url_description">This URL has <strong>Read+Write</strong> access</p>
      </div>
    </div>


        

      </div><!-- /.pagehead -->

      









<script type="text/javascript">
  GitHub.currentCommitRef = 'master'
  GitHub.currentRepoOwner = 'morganp'
  GitHub.currentRepo = "Code-Dojo"
  GitHub.downloadRepo = '/morganp/Code-Dojo/archives/master'
  GitHub.revType = "master"

  GitHub.controllerName = "blob"
  GitHub.actionName     = "show"
  GitHub.currentAction  = "blob#show"

  
    GitHub.hasWriteAccess = true
    GitHub.hasAdminAccess = true
    GitHub.watchingRepo = true
    GitHub.ignoredRepo = false
    GitHub.hasForkOfRepo = null
    GitHub.hasForked = true
  

  
</script>










  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/morganp/Code-Dojo/commit/fbd04ca90dbed42b0bf00cb4019ab37bd49682e4">Fixed loads of things. Probably?</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img src="http://www.gravatar.com/avatar/a2a704981636fcbc990abf75a0c7d5e7?s=140&d=http%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
        </div>
        <div class="name"><a href="/morganp">morganp</a> <span>(author)</span></div>
        <div class="date">
          <abbr class="relatize" title="2010-08-09 06:46:04">Mon Aug 09 06:46:04 -0700 2010</abbr>
        </div>
      </div>

      

    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/morganp/Code-Dojo/commit/fbd04ca90dbed42b0bf00cb4019ab37bd49682e4" hotkey="c">fbd04ca90dbed42b0bf0</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/morganp/Code-Dojo/tree/fbd04ca90dbed42b0bf00cb4019ab37bd49682e4" hotkey="t">294e0907e2d82170f830</a><br />
      
        <span>p</span>arent&nbsp;
        
        <a href="/morganp/Code-Dojo/tree/08815a01d09304efe8b844b47594f2fe038578e1" hotkey="p">08815a01d09304efe8b8</a>
      

    </div>
  </div>

    </div>
  </div>



  
    <div id="path">
      <b><a href="/morganp/Code-Dojo/tree/master">Code-Dojo</a></b> / <a href="/morganp/Code-Dojo/tree/master/ORM">ORM</a> / <a href="/morganp/Code-Dojo/tree/master/ORM/lesson-01">lesson-01</a> / <a href="/morganp/Code-Dojo/tree/master/ORM/lesson-01/solution">solution</a> / rakefile.rb       <span style="display:none" id="clippy_2310">ORM/lesson-01/solution/rakefile.rb</span>
      
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="http://assets3.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_2310&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="http://assets3.github.com/flash/clippy.swf?v5"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_2310&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      

    </div>

    <div id="files">
      <div class="file">
        <div class="meta">
          <div class="info">
            <span class="icon"><img alt="Txt" height="16" src="http://assets0.github.com/images/icons/txt.png?935bbdff6dd3f65d860d46e4de77e4ea817dc684" width="16" /></span>
            <span class="mode" title="File Mode">100755</span>
            
              <span>28 lines (20 sloc)</span>
            
            <span>0.698 kb</span>
          </div>
          <ul class="actions">
            
              <li><a id="file-edit-link" href="#" rel="/morganp/Code-Dojo/file-edit/__ref__/ORM/lesson-01/solution/rakefile.rb">edit</a></li>
            
            <li><a href="/morganp/Code-Dojo/raw/master/ORM/lesson-01/solution/rakefile.rb" id="raw-url">raw</a></li>
            
              <li><a href="/morganp/Code-Dojo/blame/master/ORM/lesson-01/solution/rakefile.rb">blame</a></li>
            
            <li><a href="/morganp/Code-Dojo/commits/master/ORM/lesson-01/solution/rakefile.rb">history</a></li>
          </ul>
        </div>
        
  <div class="data type-ruby">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <pre class="line_numbers"><span id="LID1" rel="#L1">1</span>
<span id="LID2" rel="#L2">2</span>
<span id="LID3" rel="#L3">3</span>
<span id="LID4" rel="#L4">4</span>
<span id="LID5" rel="#L5">5</span>
<span id="LID6" rel="#L6">6</span>
<span id="LID7" rel="#L7">7</span>
<span id="LID8" rel="#L8">8</span>
<span id="LID9" rel="#L9">9</span>
<span id="LID10" rel="#L10">10</span>
<span id="LID11" rel="#L11">11</span>
<span id="LID12" rel="#L12">12</span>
<span id="LID13" rel="#L13">13</span>
<span id="LID14" rel="#L14">14</span>
<span id="LID15" rel="#L15">15</span>
<span id="LID16" rel="#L16">16</span>
<span id="LID17" rel="#L17">17</span>
<span id="LID18" rel="#L18">18</span>
<span id="LID19" rel="#L19">19</span>
<span id="LID20" rel="#L20">20</span>
<span id="LID21" rel="#L21">21</span>
<span id="LID22" rel="#L22">22</span>
<span id="LID23" rel="#L23">23</span>
<span id="LID24" rel="#L24">24</span>
<span id="LID25" rel="#L25">25</span>
<span id="LID26" rel="#L26">26</span>
<span id="LID27" rel="#L27">27</span>
<span id="LID28" rel="#L28">28</span>
</pre>
          </td>
          <td width="100%">
            
              <div class="highlight"><pre><div class='line' id='LC1'>&nbsp;<span class="c1">#!/usr/bin/env ruby</span></div><div class='line' id='LC2'><br/></div><div class='line' id='LC3'><span class="c1">##http://blog.aizatto.com/2007/05/27/activerecord-migrations-without-rails/</span></div><div class='line' id='LC4'><span class="c1"># $ rake db:migrate VERSION=0</span></div><div class='line' id='LC5'><br/></div><div class='line' id='LC6'><span class="nb">require</span> <span class="s1">&#39;rubygems&#39;</span></div><div class='line' id='LC7'><span class="nb">require</span> <span class="s1">&#39;rake&#39;</span></div><div class='line' id='LC8'><span class="nb">require</span> <span class="s1">&#39;active_record&#39;</span></div><div class='line' id='LC9'><br/></div><div class='line' id='LC10'><span class="c1">#task :default =&gt; :db:migrate</span></div><div class='line' id='LC11'><br/></div><div class='line' id='LC12'><span class="n">namespace</span> <span class="ss">:db</span> <span class="k">do</span></div><div class='line' id='LC13'>&nbsp;&nbsp;&nbsp;<span class="n">desc</span> <span class="s2">"Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"</span></div><div class='line' id='LC14'>&nbsp;&nbsp;&nbsp;<span class="n">task</span> <span class="ss">:migrate</span> <span class="o">=&gt;</span> <span class="ss">:environment</span> <span class="k">do</span></div><div class='line' id='LC15'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">ActiveRecord</span><span class="o">::</span><span class="no">Migrator</span><span class="o">.</span><span class="n">migrate</span><span class="p">(</span><span class="s1">&#39;migrate&#39;</span><span class="p">,</span> <span class="no">ENV</span><span class="o">[</span><span class="s2">"VERSION"</span><span class="o">]</span> <span class="p">?</span> <span class="no">ENV</span><span class="o">[</span><span class="s2">"VERSION"</span><span class="o">].</span><span class="n">to_i</span> <span class="p">:</span> <span class="kp">nil</span> <span class="p">)</span></div><div class='line' id='LC16'>&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC17'><span class="k">end</span> </div><div class='line' id='LC18'><br/></div><div class='line' id='LC19'><span class="n">task</span> <span class="ss">:environment</span> <span class="k">do</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;<span class="no">ActiveRecord</span><span class="o">::</span><span class="no">Base</span><span class="o">.</span><span class="n">establish_connection</span><span class="p">(</span></div><div class='line' id='LC21'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:adapter</span>   <span class="o">=&gt;</span> <span class="s1">&#39;sqlite3&#39;</span><span class="p">,</span></div><div class='line' id='LC22'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ss">:database</span>  <span class="o">=&gt;</span> <span class="s1">&#39;./lesson1_AR.db&#39;</span></div><div class='line' id='LC23'>&nbsp;&nbsp;&nbsp;<span class="p">)</span></div><div class='line' id='LC24'>&nbsp;&nbsp;&nbsp;<span class="no">ActiveRecord</span><span class="o">::</span><span class="no">Base</span><span class="o">.</span><span class="n">logger</span> <span class="o">=</span> <span class="no">Logger</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="no">File</span><span class="o">.</span><span class="n">open</span><span class="p">(</span><span class="s1">&#39;database.log&#39;</span><span class="p">,</span> <span class="s1">&#39;a&#39;</span><span class="p">))</span></div><div class='line' id='LC25'><span class="k">end</span></div><div class='line' id='LC26'><br/></div><div class='line' id='LC27'><br/></div><div class='line' id='LC28'><br/></div></pre></div>
            
          </td>
        </tr>
      </table>
    
  </div>


      </div>
    </div>

  


    </div>
  
      
    </div>

    <div id="footer" class="clearfix">
      <div class="site">
        <div class="sponsor">
          <a href="http://www.rackspace.com" class="logo">
            <img alt="Dedicated Server" src="http://assets0.github.com/images/modules/footer/rackspace_logo.png?935bbdff6dd3f65d860d46e4de77e4ea817dc684" />
          </a>
          Powered by the <a href="http://www.rackspace.com ">Dedicated
          Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
          Computing</a> of Rackspace Hosting<span>&reg;</span>
        </div>

        <ul class="links">
          <li class="blog"><a href="http://github.com/blog">Blog</a></li>
          <li><a href="http://support.github.com?sso=_-D9qfwBNALVWtVhGCwVCzX3G3akBoO36XQ8M-kMER3mItaw2V5DpBTBMMTZiae4TLBWT8uZrHwbBEcu70IcWf4y8sdOvNEZpgbHT0b18EFTal8xJxNH_FLZrXnprurXfQTapGxWQI1ubJcwdyfLt6cTMHN0s4kvL70UuLKDbrPyFGnr-vK4QvH5V3IMsIcyu7xHraSkMEntbqHH4rXp7yZAmQ0t7c4ZietslONrnmep50k1iDa1Y1w_cLMJjfmF">Support</a></li>
          <li><a href="http://github.com/training">Training</a></li>
          <li><a href="http://jobs.github.com">Job Board</a></li>
          <li><a href="http://shop.github.com">Shop</a></li>
          <li><a href="http://github.com/contact">Contact</a></li>
          <li><a href="http://develop.github.com">API</a></li>
          <li><a href="http://status.github.com">Status</a></li>
        </ul>
        <ul class="sosueme">
          <li class="main">&copy; 2010 <span id="_rrt" title="0.29133s from fe3.rs.github.com">GitHub</span> Inc. All rights reserved.</li>
          <li><a href="/site/terms">Terms of Service</a></li>
          <li><a href="/site/privacy">Privacy</a></li>
          <li><a href="http://github.com/security">Security</a></li>
        </ul>
      </div>
    </div><!-- /#footer -->

    
      
      
        <!-- current locale:  -->
        <div class="locales">
          <div class="site">

            <ul class="choices clearfix limited-locales">
              <li><span class="current">English</span></li>
              
                
                  <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=fr">Français</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=zh">中文</a></li>
                
              
              <li class="all"><a href="#" class="minibutton btn-forward js-all-locales"><span><span class="icon"></span>See all available languages</span></a></li>
            </ul>

            <div class="all-locales clearfix">
              <h3>Your current locale selection: <strong>English</strong>. Choose another?</h3>
              
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=en">English</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=af">Afrikaans</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=ca">Català</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=cs">Čeština</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=es">Español</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=fr">Français</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=hr">Hrvatski</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=id">Indonesia</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=it">Italiano</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=nl">Nederlands</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=no">Norsk</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=pl">Polski</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=sr">Српски</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=sv">Svenska</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=zh">中文</a></li>
                    
                  
                </ul>
              
            </div>

          </div>
          <div class="fade"></div>
        </div>
      
    

    <script>window._auth_token = "3afe551c26d99f12e8974d11dadbbfbd21053acf"</script>
    

    <!--[if IE 8]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie8")
    </script>
    <![endif]-->

    <!--[if IE 7]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie7")
    </script>
    <![endif]-->

    <script type="text/javascript">
      _kmq.push(['trackClick', 'entice_banner_link', 'Entice banner clicked']);
      
    </script>
    
  </body>
</html>

