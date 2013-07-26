module ApplicationHelper

    # default api response format
    def rest_output(model, model_name = 'items', options = {})
        total_elements = if model.respond_to?(:size)
            model.size
        else
            model.id == nil ? 0 : 1
        end

        defaults = {
            success: true, 
            error_code: nil, 
            error_msg: nil,
            total_elements: total_elements,
        }
        defaults[model_name] = total_elements > 0 ? model.as_json : []
        options.reverse_merge(defaults).stringify_keys!
    end


end