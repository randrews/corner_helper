module CornerHelper

  def corner_style name='my-rounded', opts={}
    p=opts.reverse_merge({ :background=>"#ffffff",
                           :image=>'corners.png',
                           :border_color=>'black',
                           :border_width=>"3px",
                           :radius=>"16px",
                           :class=>name})

    "<style type=\"text/css\">#{css_for(p)}</style>".squish
  end

  def in_rounded_corners name='my-rounded'
    concat <<END
<div class="#{name}-rounded">
  <div class="#{name}-ul #{name}-corner"></div>
  <div class="#{name}-ur #{name}-corner"></div>
  <div class="#{name}-ll #{name}-corner"></div>
  <div class="#{name}-lr #{name}-corner"></div>
  <div class="#{name}-content">
END

    yield

    concat "</div></div>"
  end

  private

  def css_for p
    template.result binding
  end

  def template
    @@template ||= 
      ERB.new(File.read(File.join(File.dirname(__FILE__),
                                  '..','res','corners.css.erb')))
  end
end
