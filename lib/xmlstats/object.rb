module Xmlstats

  class Object

    def initialize params = {}
      params.each do |key, value|
        instance_variable_set "@#{key}", value
      end

      self.class.object_references.each do |field_name, field_type|
        ivar = "@#{field_name}"
        val  = instance_variable_get(ivar)

        # Turn hashes into objects, turn arrays into arrays of objects.
        obj =
          case val
          when Array then val.map { |v| field_type.new v }
          else            field_type.new val
          end

        instance_variable_set ivar, obj
      end
    end

    def fields
      instance_variables.map(&:to_s).map { |s| s.gsub(/^@/, "").to_sym }
    end

    def method_missing name, *args, &block
      ivar = instance_variable_get("@#{name}")
      return ivar if ivar
      super
    end

    def self.reference field_name, field_type
      @object_references ||= []
      @object_references << [ field_name, field_type ]
    end

    def self.object_references
      @object_references ||= []
    end

  end

  module Objects
  end

end
