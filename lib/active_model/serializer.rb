# frozen_string_literal: true

class ActiveModel::Serializer
  with_options instance_writer: false, instance_reader: true do |serializer|
    serializer.class_attribute :_named_contexts
    self._named_contexts ||= {}
    serializer.class_attribute :_context_extensions
    self._context_extensions ||= {}
  end

  def self.context(*named_contexts)
    named_contexts.each do |context|
      _named_contexts[context] = true
    end
  end

  def self.context_extensions(*extension_names)
    extension_names.each do |extension_name|
      _context_extensions[extension_name] = true
    end
  end
end
