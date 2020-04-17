function is_dir_valid(directory::String)
    if !isdir(directory)
        false
    end
    # we assume the directory will have read write access for now.
    true
end

function reformat(text::String)
    text # TODO: Replace with a code formatter.
end