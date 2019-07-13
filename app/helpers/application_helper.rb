module ApplicationHelper
    def pluralize_without_count(count, noun, text = nil)
        if count != 0
            count == 1 ? "#{text}#{noun}" : "#{text}#{noun.pluralize}"
        end
    end
end
