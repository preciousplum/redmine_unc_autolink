module RedmineUncAutolink
  module TextileFormatterPatch

    include Redmine::WikiFormatting::LinksHelper
    alias :inline_auto_unc :auto_unc!
    RULES = [:textile, :block_markdown_rule, :inline_auto_link, :inline_auto_mailto, :inline_auto_unc]

    def self.included(base)
      base.send :include, InstanceMethods
      base.class_eval do
        alias_method :to_html_without_auto_unc, :to_html
        alias_method :to_html, :to_html_with_auto_unc
      end
    end

    module  InstanceMethods
      def to_html_with_auto_unc(*rules)
          @toc = []
          public_method(:to_html_without_auto_unc).super_method.call(*RULES).to_s
      end
    end
  end
end
