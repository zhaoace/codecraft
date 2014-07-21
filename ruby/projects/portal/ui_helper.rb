


class UiHelper
    def self.entry_response_width entry
        entry.width  = (entry.value.length + 10 )   unless (  entry.value.length + 10   <  entry.width)
        entry.width  =  30  unless (  entry.value.length + 10   > 30)
    end

    def self.clean_text target
        target.text = ""
    end

end