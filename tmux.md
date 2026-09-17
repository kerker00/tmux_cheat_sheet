# tmux

there are a lot of tmux cheat sheets out there, but this one is mine.

## Terminal

Start a new unnamed session

``` bash
tmux
tmux new
tmux new-session
```

Start a new *named* session

``` bash
tmux new -s mysession
```

List all running sessions

```bash
tmux ls
```

## Configuration

The modifier key is set to `Ctrl+a`; therefore, this cheat sheet follows the configuration file in this repository.

In the following sections, `Prefix` means `Ctrl+a`. Press the prefix first, release it, and then press the command key.

## Attach and detach

Attach to the most recently used session

```bash
tmux attach
tmux a
```

Attach to a named session

```bash
tmux attach -t mysession
```

Detach from the current session and leave it running

```text
Prefix d
```

List clients attached to sessions

```bash
tmux list-clients
```

## Session management

Create a named session from the command line

```bash
tmux new-session -s mysession
```

Rename the current session

```text
Prefix $
```

Switch to another session

```text
Prefix s
```

Switch to the previous session

```text
Prefix (
```

Switch to the next session

```text
Prefix )
```

Kill a session from the command line

```bash
tmux kill-session -t mysession
```

Kill the current session

```text
Prefix &
```

## Windows

Create a new window

```text
Prefix c
```

Rename the current window

```text
Prefix ,
```

List windows and select one

```text
Prefix w
```

Move to the next or previous window

```text
Prefix n
Prefix p
```

Select a window by number

```text
Prefix 0 ... Prefix 9
```

Move the current window left or right

```text
Prefix <
Prefix >
```

Close the current window

```text
Prefix &
```

## Panes

Split the current window horizontally or vertically. These bindings are defined in `tmux.conf`.

```text
Prefix |
Prefix -
```

Move to a pane

```text
Prefix Up
Prefix Down
Prefix Left
Prefix Right
```

Move to the next pane

```text
Prefix o
```

Toggle between the current and previous pane

```text
Prefix ;
```

Show pane numbers and select one

```text
Prefix q
```

Toggle the current pane between zoomed and normal size

```text
Prefix z
```

Swap the current pane with the previous or next pane

```text
Prefix {
Prefix }
```

Close the current pane

```text
Prefix x
```

Resize the current pane

```text
Prefix Alt+Up
Prefix Alt+Down
Prefix Alt+Left
Prefix Alt+Right
```

With mouse mode enabled, panes can also be selected and resized with the mouse.

## Copy mode

Enter copy mode

```text
Prefix [
```

Search forward or backward in the scrollback buffer

```text
/
?
```

Leave copy mode

```text
q
```

In the default emacs mode, start and finish a selection with the mouse or with `Ctrl+Space` and `Enter`. Paste the most recent copied text with:

```text
Prefix ]
```

## Command prompt and help

Open the tmux command prompt

```text
Prefix :
```

Show all key bindings

```text
Prefix ?
```

Reload the configuration without restarting tmux

```text
Prefix :
source-file ~/.tmux.conf
Enter
```

The same action from the shell:

```bash
tmux source-file ~/.tmux.conf
```

## Useful commands

Run a command in an existing session or window

```bash
tmux send-keys -t mysession:0.0 'echo hello' Enter
```

Capture the visible contents of a pane

```bash
tmux capture-pane -p -t mysession:0.0
```

Kill all tmux sessions

```bash
tmux kill-server
```

Show the effective tmux options

```bash
tmux show-options -g
tmux show-window-options -g
```
