#!/usr/bin/env gawk -i inplace -f

BEGIN {
    prev = ""
    stored_blank = 0
}

{
    # If we stored a blank line from previous iteration
    if (stored_blank) {
        # Check if current line starts with < and previous was ----
        if ($0 ~ /^</ && prev ~ /^----/) {
            # Pattern matched: skip the stored blank line
            print $0
            prev = $0
            stored_blank = 0
            next
        } else {
            # Not the pattern, print the stored blank line
            print ""
            stored_blank = 0
        }
    }

    # Check if current line is blank (empty or whitespace only)
    if ($0 ~ /^[[:space:]]*$/) {
        # Check if previous line was ----
        if (prev ~ /^----/) {
            # Store this blank line, don't print yet
            stored_blank = 1
            next
        } else {
            # Just print the blank line normally
            print $0
            prev = $0
            next
        }
    }

    # Regular line, print it
    print $0
    prev = $0
}

END {
    # If we have a stored blank line at the end, print it
    if (stored_blank) {
        print ""
    }
}
