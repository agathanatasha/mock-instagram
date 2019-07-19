module ApplicationHelper
    def create_url string
        return "http://#{string}" unless string.start_with?("http://", "https://")
        string
    end
end
