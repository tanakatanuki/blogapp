module BblogsHelper
    def choose_new_or_edit
        if action_name == "new" || action_name == "confirm"
            confirm_bblogs_path
        elsif action_name == "edit"
            bblog_path
        end
    end
end
