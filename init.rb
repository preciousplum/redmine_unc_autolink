require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'redmine/wiki_formatting'
  require_dependency 'redmine/wiki_formatting/textile/formatter'

  unless Redmine::WikiFormatting::LinksHelper.included_modules.include? RedmineUncAutolink::LinksHelperPatch
    Redmine::WikiFormatting::LinksHelper.send :include, RedmineUncAutolink::LinksHelperPatch
  end

  unless Redmine::WikiFormatting::Textile::Formatter.included_modules.include? RedmineUncAutolink::TextileFormatterPatch
    Redmine::WikiFormatting::Textile::Formatter.send :include, RedmineUncAutolink::TextileFormatterPatch
  end
end


Redmine::Plugin.register :redmine_unc_autolink do
  name 'UNC Autolink plugin'
  author 'preciousplum'
  description 'Create link from UNC format strings like outlook automatically when showing textile format field.'
  version '0.0.2'
  url 'https://github.com/preciousplum/redmine_unc_autolink'
  author_url 'https://github.com/preciousplum/'
end
