module ApplicationHelper

    # default api response format
    def rest_output(model, options = {})
        total_elements = model.size
        model_name = total_elements > 1 ? model.name.pluralize : model.name
        defaults = {
            success: true, 
            error_code: nil, 
            error_msg: nil,
            total_elements: total_elements
        }
        defaults[model_name.downcase] = model.as_json
        defaults = options.reverse_merge(defaults)
    end


end