module Omnomnom
  module Helpers

    def link_to(name, href, opts={})
      attrs = ""
      opts.each { |k,v| attrs << "#{k}=\"#{v}\" " } #.join(" ")
      %(<a href="#{href}" #{attrs}>#{name}</a>)
    end

    def partial(template, *args)
      options = args.extract_options!
      options.merge!(:layout => false)
      path = template.to_s.split(File::SEPARATOR)
      object = path[-1].to_sym
      path[-1] = "_#{path[-1]}"
      template = File.join(path).to_sym
      if collection = options.delete(:collection)
        collection.inject([]) do |buffer, member|
            buffer << erb(template, options.merge(:layout => false, :locals => {object => member}))
        end.join("\n")
      else
        erb(template, options)
      end
    end

    def image_tag(src, desc="")
      %(<img src="#{src}" alt="#{desc}" />)
    end

  end
end
