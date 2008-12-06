# Ted's iPhone RDoc template
require 'erb'

module RDoc
  module Page

    class << self
      
      def read( template )
        @dir ||= File.join(File.dirname(__FILE__), 'templates')
        prefix = "#{@dir}/#{template}"
        [ 'html', 'css', 'xml' ].each do |ext|
          filename = "#{prefix}.#{ext}"
          if File.exists?(filename)
            return ERB.new(File.new(filename).read).result(binding)
          end
        end
        return nil
      end
      
    end

    FONTS = ""
    XHTML_PREAMBLE = %{<?xml version="1.0" encoding="%charset%"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
}
    GOOGLE_ANALYTICS = read('analytics')
    STYLE = read('styles')
    GOOGLE_ADSENSE = read('adsense')
    HEADER = read('header') 
    FILE_PAGE = read('file')
    CLASS_PAGE = read('class')
    METHOD_LIST = read('methods')
    FOOTER = read('footer')
    BODY = read('body')
    SRC_PAGE = read('source')
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
    GOOGLE_SEARCH_FORM = read('search')
    FILE_INDEX = read('files')
    CLASS_INDEX = FILE_INDEX
    METHOD_INDEX = FILE_INDEX
    INDEX = read('index')
  end
end