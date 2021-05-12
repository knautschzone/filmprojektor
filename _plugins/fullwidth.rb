## This has a fairly harmless hack that wraps the img tag in a div to prevent it from being
## wrapped in a paragraph tag instead, which would totally fuck things up layout-wise
## Usage {% fullwidth 'path/to/image' 'caption goes here in quotes' %}
#
module Jekyll
  class RenderFullWidthTag < Liquid::Tag
    
    require "shellwords"
    require "kramdown"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
    end

    def render(context)

      # Gather settingsJekyll::RenderFullWidthTag:0x000055e84828a8a8
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)

      baseurl = context.registers[:site].config['baseurl']
      label = Kramdown::Document.new(@text[1],{remove_span_html_tags:true}).to_html # render markdown in caption
      label = converter.convert(label).gsub(/<\/?p[^>]*>/, "").chomp # remove <p> tags from render output

      # Is it youtube?
      if @text[0].start_with?('YOUTUBE:')
        "<figure class='fullwidth'>"+
        "<iframe class='ytplayer-fullwidth' type='text/html' width='100%' height='100%' "+
        "src='https://www.youtube.com/embed/#{@text[0][8..]}' "+
        "frameborder='0'></iframe>"+
        "<figcaption>#{label}</figcaption></figure>"
      else
        if @text[0].start_with?('http://', 'https://','//')
          "<figure class='fullwidth'><img src='#{@text[0]}'/>"+
          "<figcaption>#{label}</figcaption></figure>"
        else
          "<figure class='fullwidth'><img src='#{baseurl}/#{@text[0]}'/>"+
          "<figcaption>#{label}</figcaption></figure>"
        end
      end
    end
  end
end

Liquid::Template.register_tag('fullwidth', Jekyll::RenderFullWidthTag)
