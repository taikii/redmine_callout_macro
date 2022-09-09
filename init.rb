require File.expand_path('lib/callout_macro_hook', __dir__)

Redmine::Plugin.register :redmine_callout_macro do
  name 'Redmine Callout Macro plugin'
  author 'taikii'
  description 'Add Callouts to wiki.'
  version '1.0.2'
  url 'https://github.com/taikii/redmine_callout_macro'
  author_url 'https://taikii.net/'

  Redmine::WikiFormatting::Macros.register do
    desc "Add Callouts to wiki. Example:\n\n" +
    "{{info(INFO)\n" +
    "This is information block.\n" +
    "}}"
    macro :info do |obj, args, text|
      out = ''.html_safe
      out << content_tag(:div, :class => 'callout-info callout') do
        concat content_tag(:p, args.first.to_s, :class => 'callout-header') if args.size > 0
        concat textilizable(text, :object => obj, :headings => false)
      end
      out
    end

    desc "Add Callouts to wiki. Example:\n\n" +
    "{{warning(WARNING)\n" +
    "This is warning block.\n" +
    "}}"
    macro :warning do |obj, args, text|
      out = ''.html_safe
      out << content_tag(:div, :class => 'callout-warning callout') do
        concat content_tag(:p, args.first.to_s, :class => 'callout-header') if args.size > 0
        concat textilizable(text, :object => obj, :headings => false)
      end
      out
    end

    desc "Add Callouts to wiki. Example:\n\n" +
    "{{danger(INFO)\n" +
    "This is danger block.\n" +
    "}}"
    macro :danger do |obj, args, text|
      out = ''.html_safe
      out << content_tag(:div, :class => 'callout-danger callout') do
        concat content_tag(:p, args.first.to_s, :class => 'callout-header') if args.size > 0
        concat textilizable(text, :object => obj, :headings => false)
      end
      out
    end
  end
end
