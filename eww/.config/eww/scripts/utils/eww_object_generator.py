def create_button (classname, onclick, content):
    return f"(button :class \"{classname}\" :onclick \"{onclick}\" \"{content}\")"


def create_box (preamble, classname, content, quote=True):
    if quote:
        return f"(box {preamble} :class \"{classname}\" \"{content}\")"

    return f"(box {preamble} :class \"{classname}\" {content})"
