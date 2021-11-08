module ApplicationHelper
    def titleize(str)
        str.split(/ |\_/).map(&:capitalize).join(" ")
    end
end
