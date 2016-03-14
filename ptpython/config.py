from __future__ import unicode_literals

__all__ = (
        'configure',
        )


def configure(repl):
    repl.prompt_style = 'ipython'
    repl.true_color = True
    repl.confirm_exit = False
