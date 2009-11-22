module VersionedTemplates

  def self.included(base) #:nodoc:
    base.extend(ClassMethods)
  end

  module ClassMethods
    # Declare templates that should be rendered in place of existing templates.
    #   versioned_templates {:index => :index_extra_wide, :edit => :special_edit}
    # Any render of "index" (by default or by calling render) will actually look for
    # template "index_extra_wide".
    def versioned_templates(hash)
      @config = Hash[*hash.map {|k,v| [k.to_s,v.to_s] }.flatten]
      include VersionedTemplates::InstanceMethods
    end
    
    def versioned_templates_config #:nodoc:
      @config || self.superclass.instance_variable_get('@config')
    end
  end

  module InstanceMethods #:nodoc:
    def default_template_name(action_name = self.action_name) #:nodoc:
      full_path_to_template = super
      controller_name, action = full_path_to_template.split('/', 2)
      if self.class.versioned_templates_config.has_key?(action)
        "#{controller_name}/#{self.class.versioned_templates_config[action]}"
      else
        full_path_to_template
      end
    end
  end

end
