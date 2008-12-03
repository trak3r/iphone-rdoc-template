# Ted's iPhone RDoc template
#
# Based on the Hongli Lai template:
# http://izumi.plan99.net/blog/
#
# Based on the Jamis template:
# http://weblog.jamisbuck.org/2005/4/8/rdoc-template
module RDoc
module Page

FONTS = ""

STYLE = <<CSS
body {
  font-family: Helvetica;
  font-size: 32pt;
}
CSS

XHTML_PREAMBLE = %{<?xml version="1.0" encoding="%charset%"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
}

HEADER = XHTML_PREAMBLE + <<ENDHEADER
<html>
  <head>
    <title>
      %title%
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=%charset%" />
    <link rel="stylesheet" href="%style_url%" type="text/css" media="screen" />
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
ENDHEADER

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
  <div>
    %type% 
    %category% 
    methods
  </div>
START:methods
<div>
  <div>
IF:callseq
    <a name="%aref%">%callseq%</a>
ENDIF:callseq
IFNOT:callseq
    <a name="%aref%">%name%</a>
    %params%
ENDIF:callseq
IF:codeurl
    [<a href="%codeurl%" target="SOURCE_CODE" onclick="javascript:openCode('%codeurl%'); return false;">source</a>]
ENDIF:codeurl
  </div>
IF:m_desc
  <div>
    %m_desc%
  </div>
ENDIF:m_desc
IF:aka
  <div>
    This method is also aliased as
START:aka
    <a href="%aref%">%name%</a>
END:aka
  </div>
ENDIF:aka
IF:sourcecode
  [<a href="javascript:toggleSource('%aref%_source')" id="l_%aref%_source">show source</a>]
  <div id="%aref%_source" class="dyn-source">
<pre>
%sourcecode%
</pre>
  </div>
</div>
ENDIF:sourcecode
</div>
END:methods
ENDIF:methods
END:method_list
ENDIF:method_list

END:sections
  </dl>
HTML

FOOTER = <<ENDFOOTER
  </body>
</html>
ENDFOOTER

BODY = HEADER + <<ENDBODY
  !INCLUDE! <!-- banner header -->
  <div id="bodyContent">
    #{METHOD_LIST}
  </div>
  #{FOOTER}
ENDBODY

SRC_PAGE = XHTML_PREAMBLE + <<HTML
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

FILE_INDEX = XHTML_PREAMBLE + <<HTML
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=%charset%" />
    <title>
      %list_title%
    </title>
    <style type="text/css">
body {
  font-family: Helvetica;
  font-size: 32pt;
}
ul {
  list-style-type: none;
}
li {
  float: none;
}
    </style>
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
  </body>
</html>
HTML

CLASS_INDEX = FILE_INDEX
METHOD_INDEX = FILE_INDEX

INDEX = XHTML_PREAMBLE + <<HTML
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=%charset%" />
    <title>
      %title%
    </title>
    <style type="text/css">
body {
  font-family: Helvetica;
  font-size: 32pt;
}
ul {
  list-style-type: none;
}
li {
  float: none;
}
    </style>
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
  </body>
</html>
HTML

end
end