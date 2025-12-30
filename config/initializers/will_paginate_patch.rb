require "will_paginate/view_helpers/action_view"

module WillPaginate
  module ActionView
    class LinkRenderer
      # Rename the internal tag method to avoid collision with Rails 8's tag helper
      def will_paginate_tag(name, value, attributes = {})
        string_attributes = attributes.map do |pair|
          unless pair.last.nil?
            %( #{pair.first}="#{CGI.escapeHTML(pair.last.to_s)}")
          end
        end
        "<#{name}#{string_attributes.compact.join("")}>#{value}</#{name}>".html_safe
      end

      # Alias tag to will_paginate_tag to maintain internal calls
      alias_method :tag, :will_paginate_tag
    end
  end
end

# Also patch the Bootstrap renderer if it's being used
if defined?(WillPaginate::ActionView::BootstrapLinkRenderer)
  module WillPaginate
    module ActionView
      class BootstrapLinkRenderer
        # Ensure it also uses the safe alias
        alias_method :tag, :will_paginate_tag
      end
    end
  end
end
