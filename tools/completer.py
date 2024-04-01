import click
from click.parser import split_arg_string
from click.shell_completion import ShellComplete
from prompt_toolkit.completion import Completer, Completion

class CommandCompleter(Completer):
    def __init__(self, group):
        self.group = group

    def get_completions(self, document, complete_event):
        completer = ShellComplete(self.group, {}, '', '')

        args = split_arg_string(document.text_before_cursor)
        incomplete = ''
        if not document.char_before_cursor.isspace():
            incomplete = args.pop()

        results = completer.get_completions(args, incomplete)

        # FIXME: expand file/dir completions
        for item in results:
            yield Completion(item.value + ' ', start_position=-len(incomplete))
