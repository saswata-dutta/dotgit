"""
Configuration for ``ptpython``.

"""


__all__ = ["configure"]


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
    # https://pygments.org/styles/
    repl.use_code_colorscheme("fruity")
    repl.cursor_shape_config = "Blink beam"
    repl.enable_mouse_support = True
