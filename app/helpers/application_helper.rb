module ApplicationHelper
    
    def full_title(page_title = "")
        base_title = "Ruby on Rails"
        if page_title.empty?
            base_title
        else
            "#{page_title}\n#{base_title}"
        end
    end
    
    def simple_time(time)
             
        time.strftime("%Y-%m-%d　%H:%M　")
    end
end
