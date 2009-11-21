module VersionedTemplates

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def versioned_templates(input)
      @config = Hash[*input.map {|k,v| [k.to_s,v.to_s] }.flatten]
      include VersionedTemplates::InstanceMethods
    end
    
    def versioned_templates_config
      @config || self.superclass.instance_variable_get('@config')
    end
  end

  module InstanceMethods
    def default_template_name(action_name = self.action_name)
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
