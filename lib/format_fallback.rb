require "format_fallback/version"

module ActionView
=begin
  class PathSet

    def find_with_default_template(*args)
      prefixes = args[1]
      if prefixes.include?("layouts")
        # Layouts have their own way of managing fallback, better leave them alone
        find_without_default_template(*args)
      else
        details = args[3]
        details[:formats] << :html unless details[:formats].include?(:html)
        find_without_default_template(*args)
      end
    end
    alias_method_chain :find, :default_template

  end
=end

  class PathResolver
    # Rails 4 Upgrade
    # ActionPack 4 does not specify 5th param. This is a breaking change
    def find_templates_with_default(name, prefix, partial, details)
      details[:formats] << :html unless details[:formats].include?(:html)

      find_templates_without_default(name, prefix, partial, details)
    end

    alias_method_chain :find_templates, :default
  end
end
