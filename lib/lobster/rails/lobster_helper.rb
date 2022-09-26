require 'action_view/helpers'

module Lobster
  module Rails
    module LobsterHelper
      # Wrapper around form_with that automatically populates some data attributes:
      #   - data-lob-mangle
      #   - data-lob-values
      #   - data-lob-errors
      #
      # Example usage:
      #   lob_form_with(
      #     model: model,
      #     data: { lob: 'abc123' },
      #     html: { style: 'min-height:400px' }
      #   ) {} %>
      #
      def lob_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
        scope_for_mangle = scope

        if model
          model = model.is_a?(Array) ? model.last : model
          scope_for_mangle ||= model_name_from_record_or_class(model).param_key
        end

        # Add default options
        options = options.dup
        options[:data] = (options[:data] || {}).with_indifferent_access.tap do |data|
          data[:'lob-mangle'] ||= "#{scope_for_mangle}[$name]"
          if model
            data[:'lob-values'] ||= model.as_json
            data[:'lob-errors'] = model.errors.map { [ _1.attribute, _1.full_message ] }.to_h
          end

          if data['lob-tuples']
            data[:'lob-tuples'] = data['lob-tuples'].map do |key, value|
              if value.is_a?(Hash)
                # translate { red: "Red" } to lobster preferred format
                [key, value.map { {value: _1, text: _2 } }]
              else
                [key, value]
              end
            end.to_h
          end
        end

        form_with(model: model, scope: scope, url: url, format: format, **options, &block)
      end

      def lob_tuples_from_collection(collection, value_method, text_method)
        collection.map { |record| { value: record.send(value_method), text: record.send(text_method) } }
      end
    end
  end
end
