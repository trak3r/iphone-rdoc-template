# Ted's iPhone RDoc template
#
# Based on a gutted version of the Hongli Lai template:
# http://izumi.plan99.net/blog/
module RDoc
module Page

FONTS = ""

GOOGLE_ANALYTICS = <<SNIPPET
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-1377203-4");
pageTracker._trackPageview();
} catch(err) {}</script>
SNIPPET

STYLE = <<CSS
body {
	font-family: Helvetica;
	width: 480px;
	font-size: x-small;
}
ul {
	list-style: none;
}
dt {
	font-weight: bold;
}
pre {
	overflow-x: auto;
	white-space: pre-wrap;
}
CSS

XHTML_PREAMBLE = %{<?xml version="1.0" encoding="%charset%"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
}

GOOGLE_ADSENSE = <<HTML
<script type="text/javascript"><!--
google_ad_client = "pub-3648329338598531";
/* Pocket Rails */
google_ad_slot = "9128679516";
google_ad_width = 234;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
<hr />
HTML

HEADER = <<HTML
#{XHTML_PREAMBLE}
<html>
  <head>
    <meta content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport"/>
    <meta http-equiv="Content-Type" content="text/html; charset=%charset%" />
    <link rel="stylesheet" href="%style_url%" type="text/css" media="screen" />
    <title>
      %title%
    </title>
    <script language="JavaScript" type="text/javascript">
    // <![CDATA[

        function toggleSource( id )
        {
          var elem
          var link

          if( document.getElementById )
          {
            elem = document.getElementById( id )
            link = document.getElementById( "l_" + id )
          }
          else if ( document.all )
          {
            elem = eval( "document.all." + id )
            link = eval( "document.all.l_" + id )
          }
          else
            return false;

          if( elem.style.display == "block" )
          {
            elem.style.display = "none"
            link.innerHTML = "show source"
          }
          else
          {
            elem.style.display = "block"
            link.innerHTML = "hide source"
          }
        }

        function openCode( url )
        {
          window.open( url, "SOURCE_CODE", "resizable=yes,scrollbars=yes,toolbar=no,status=no,height=480,width=750" ).focus();
        }
      // ]]>
    </script>
  </head>
  <body>
#{GOOGLE_ADSENSE}
HTML

FILE_PAGE = <<HTML
  <h1>
    %short_name%
  </h1>
  <dl>
    <dt>
      Path
    </dt>
    <dd>
      %full_path%
    </dd>
    <dt>
      Modified
    </dt>
    <dd>
      %dtm_modified%
    </dd>
  </dl>
HTML

CLASS_PAGE = <<HTML
%classmod%
  <h1>
    %full_name%
  </h1>
  <dl>
    <dt>
      Files
    </dt>
    <dd>
      <ul>
START:infiles
        <li>
          HREF:full_path_url:full_path:
        </li>
END:infiles
      </ul>
    </dd>
IF:parent
    <dt>
      Parent
    </dt>
    <dd>
IF:par_url
      <a href="%par_url%">
ENDIF:par_url
        %parent%
IF:par_url
      </a>
ENDIF:par_url
ENDIF:parent
    </dd>
  </dl>
HTML

METHOD_LIST = <<HTML
  <dl>
IF:diagram
    <dt>
      Diagram
    </dt>
    <dd>
      %diagram%
    </dd>
ENDIF:diagram

IF:description
    <dt>
      Description
    </dt>
    <dd>
      %description%
    </dd>
ENDIF:description

IF:requires
    <dt>
      Required Files
    </dt>
    <dd>
      <ul>
START:requires
        <li>HREF:aref:name:</li>
END:requires
      </ul>
    </dd>
ENDIF:requires

IF:toc
    <dt>
      Contents
    </dt>
    <dd>
      <ul>
START:toc
        <li>
          <a href="#%href%">%secname%</a>
        </li>
END:toc
      </ul>
    </dd>
ENDIF:toc

IF:methods
    <dt>
      Methods
    </dt>
    <dd>
      <ul>
START:methods
        <li>HREF:aref:name:</li>
END:methods
      </ul>
    </dd>
ENDIF:methods

IF:includes
    <dt>
      Included Modules
    </dt>
    <dd>
      <ul>
START:includes
        <li>HREF:aref:name:</li>
END:includes
      </ul>
    </dd>
ENDIF:includes

START:sections
IF:sectitle
    <dt>
      <a name="%secsequence%">%sectitle%</a>
    </dt>
IF:seccomment
    <dd>
      %seccomment%
    </dd>
ENDIF:seccomment
ENDIF:sectitle

IF:classlist
    <dt>
      Classes and Modules
    </dt>
    <dd>
      %classlist%
    </dd>
ENDIF:classlist

IF:constants
    <dt>
      Constants
    </dt>
    <dd>
      <dl>
START:constants
        <dt>
          %name%
        </dt>
        <dd>
          %value%
IF:desc
          <p>
            %desc%
          </p>
ENDIF:desc
        </dd>
END:constants
      </dl>
    </dd>
ENDIF:constants

IF:attributes
    <dt>
      Attributes
    </dt>
    <dd>
START:attributes
      <dl>
IF:rw
      [%rw%]
ENDIF:rw
        <dt>
          %name%
        </dt>
        <dd>
          %a_desc%
        </dd>
END:attributes
      </dl>
    </dd>
ENDIF:attributes

IF:method_list
START:method_list
IF:methods
    <h2>
      %type% 
      %category% 
      methods
    </h2>
START:methods

      <h3>
IF:callseq
        <a name="%aref%">%callseq%</a>
ENDIF:callseq
IFNOT:callseq
        <a name="%aref%">%name%</a>
        %params%
ENDIF:callseq
      </h3>

IF:m_desc
      <p>
        %m_desc%
      </p>
ENDIF:m_desc

IF:aka
      <dt>
        Alias
      </dt>
      <dd>
START:aka
        <a href="%aref%">%name%</a>
END:aka
      </dd>
ENDIF:aka

END:methods
ENDIF:methods
END:method_list
ENDIF:method_list

END:sections
  </dl>
HTML

FOOTER = <<HTML
#{GOOGLE_ANALYTICS}
  </body>
</html>
HTML

BODY = <<HTML
  #{HEADER}
  !INCLUDE! <!-- banner header -->
  <div id="bodyContent">
    #{METHOD_LIST}
  </div>
  #{FOOTER}
HTML

SRC_PAGE = <<HTML
#{XHTML_PREAMBLE}
<html>
  <head>
    <title>
      %title%
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=%charset%" />
    <style type="text/css">
.ruby-comment    { color: green; font-style: italic }
.ruby-constant   { color: #4433aa; font-weight: bold; }
.ruby-identifier { color: #222222;  }
.ruby-ivar       { color: #2233dd; }
.ruby-keyword    { color: #3333FF; font-weight: bold }
.ruby-node       { color: #777777; }
.ruby-operator   { color: #111111;  }
.ruby-regexp     { color: #662222; }
.ruby-value      { color: #662222; font-style: italic }
  .kw { color: #3333FF; font-weight: bold }
  .cmt { color: green; font-style: italic }
  .str { color: #662222; font-style: italic }
  .re  { color: #662222; }
    </style>
  </head>
  <body>
    <pre>
%code%
    </pre>
  </body>
</html>
HTML

FR_INDEX_BODY = <<HTML
!INCLUDE!
HTML

COMMON_HEADER = <<HTML
<html>
  <head>
    <meta content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport"/>
    <meta http-equiv="Content-Type" content="text/html; charset=%charset%" />
    <link rel="stylesheet" href="rdoc-style.css" type="text/css" media="screen" />
HTML

FILE_INDEX_GUTS = <<HTML
    <title>
      %list_title%
    </title>
  </head>
  <body>
    <h1>
      %list_title%
    </h1>
    <ul>
START:entries
      <li>
        <a href="%href%">%name%</a>
      </li>
END:entries
    </ul>
HTML

GOOGLE_SEARCH_FORM = <<HTML
<form method="get" action="http://www.google.com/search">
<input type="text" name="q" size="31" maxlength="255" value="" />
<input type="submit" value="Google Search" />
<input type="hidden" name="sitesearch" value="pocketrails.com" />
</form>
HTML

FILE_INDEX = <<HTML
#{XHTML_PREAMBLE}
#{COMMON_HEADER}
#{FILE_INDEX_GUTS}
#{FOOTER}
HTML

CLASS_INDEX = FILE_INDEX
METHOD_INDEX = FILE_INDEX

INDEX = <<HTML
#{XHTML_PREAMBLE}
#{COMMON_HEADER}
    <title>
      %title%
    </title>
  </head>
  <body>
    <h1>
      %title%
    </h1>
    <ul>
      <li>
        <a href="fr_file_index.html">Files</a>
      </li>
      <li>
        <a href="fr_class_index.html">Classes</a>
      </li>
      <li>
        <a href="fr_method_index.html">Methods</a>
      </li>
    </ul>
#{GOOGLE_SEARCH_FORM}    
#{FOOTER}
HTML

end
end