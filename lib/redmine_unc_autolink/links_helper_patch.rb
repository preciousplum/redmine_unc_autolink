module RedmineUncAutolink
  module LinksHelperPatch
    def self.included(base)      
      base.send :include, InstanceMethods
    end
    
    module  InstanceMethods
      def auto_unc!(text)
        text.gsub!(/(^|\>|[ \\t])(\\\\[^ \<]+)/) do
          head = $1
          unc = $2
          link =unc.gsub(/\\/, "/")
          %(#{head}<a class="external" href="file://#{ERB::Util.html_escape link}">#{ERB::Util.html_escape unc}</a>).html_safe
        end
        text.gsub!(/\<(\\\\[^\<\>]+)\>/) do
          unc = $1
          link =unc.gsub(/\\/, "/")
          %(&lt;<a class="external" href="file://#{ERB::Util.html_escape link}">#{ERB::Util.html_escape unc}</a>&gt;).html_safe
        end
      end
    end
  end
end
