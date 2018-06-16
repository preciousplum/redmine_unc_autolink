module RedmineUncAutolink
  module TextileFormatterPatch

    include Redmine::WikiFormatting::LinksHelper
    alias :inline_auto_unc :auto_unc!
    RULES = [:textile, :block_markdown_rule, :inline_auto_link, :inline_auto_mailto, :inline_auto_unc]

    def self.included(base)
      base.send :include, InstanceMethods
      base.class_eval do
        alias_method_chain :to_html, :contd_plugin
      end
    end

    module  InstanceMethods
      def to_html_with_contd_plugin(*rules)
          @toc = []
          public_method(:to_html).super_method.call(*RULES).to_s
      end
    end
  end
end
