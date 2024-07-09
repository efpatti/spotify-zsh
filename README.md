# Spotify ZSH Plugin

This plugin allows you to control Spotify directly from your terminal using playerctl commands.

## Installation

### 1. Install the dependencies:

- **git:** [GitHub Repository](https://github.com/git/git)
- **oh-my-zsh:** [GitHub Repository](https://github.com/ohmyzsh/ohmyzsh)

**Linux (Ubuntu/Debian)**

```sh
sudo apt-get install playerctl
```

**Linux (Fedora)**

```sh
sudo dnf install playerctl
```

**macOS**

```sh
brew install playerctl
```

### 2. Clone the repository:

```sh
git clone https://github.com/efpatti/spotify-zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/spotify-zsh
```

### 3. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

```sh
plugins=(
    # other plugins...
    spotify-zsh
)
```

### 4. Reload zsh:

```sh
source ~/.zshrc
```

## Usage

Once configured, you can control Spotify with the following commands:

- **Start playing music:**

  ```sh
  spotifyPlay
  ```

- **Pause the current track:**

  ```sh
  spotifyPause
  ```

- **Toggle play/pause:**

  ```sh
  spotifyToggle
  ```

- **Go to the previous track:**

  ```sh
  spotifyPrevious [count]
  ```

  Replace `[count]` with the number of times you want to go back. Default is 2.

- **Go to the next track:**

  ```sh
  spotifyNext [count]
  ```

  Replace `[count]` with the number of tracks forward. Default is 3.

## Logging

To enable logging of command actions, set `message_log="true"` in your `.zshrc`. Messages will display in your chosen language (`lang` variable).

## Examples

```sh
# Start playing Spotify
spotifyPlay
```

```sh
# Pause Spotify
spotifyPause
```

```sh
# Toggle play/pause
spotifyToggle
```

```sh
# Go back two tracks
spotifyPrevious 2
```

```sh
# Skip forward three tracks
spotifyNext 3
```

## Language Support

The plugin supports messages in English and Brazilian Portuguese (`pt-br`). Modify the `lang` variable in your configuration to switch languages.
